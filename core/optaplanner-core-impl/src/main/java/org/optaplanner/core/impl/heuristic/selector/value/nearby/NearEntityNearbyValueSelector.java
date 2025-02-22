package org.optaplanner.core.impl.heuristic.selector.value.nearby;

import java.util.Iterator;

import org.optaplanner.core.impl.domain.variable.descriptor.GenuineVariableDescriptor;
import org.optaplanner.core.impl.heuristic.selector.common.nearby.AbstractNearbyDistanceMatrixDemand;
import org.optaplanner.core.impl.heuristic.selector.common.nearby.NearbyDistanceMeter;
import org.optaplanner.core.impl.heuristic.selector.common.nearby.NearbyRandom;
import org.optaplanner.core.impl.heuristic.selector.common.nearby.RandomNearbyIterator;
import org.optaplanner.core.impl.heuristic.selector.entity.EntitySelector;
import org.optaplanner.core.impl.heuristic.selector.entity.mimic.MimicReplayingEntitySelector;
import org.optaplanner.core.impl.heuristic.selector.value.ValueSelector;

public final class NearEntityNearbyValueSelector<Solution_>
        extends AbstractNearbyValueSelector<Solution_, ValueSelector<Solution_>, EntitySelector<Solution_>> {

    private final boolean discardNearbyIndexZero;

    public NearEntityNearbyValueSelector(ValueSelector<Solution_> childValueSelector,
            EntitySelector<Solution_> originEntitySelector, NearbyDistanceMeter<?, ?> nearbyDistanceMeter,
            NearbyRandom nearbyRandom, boolean randomSelection) {
        super(childValueSelector, originEntitySelector, nearbyDistanceMeter, nearbyRandom, randomSelection);
        this.discardNearbyIndexZero = childValueSelector.getVariableDescriptor().getVariablePropertyType().isAssignableFrom(
                originEntitySelector.getEntityDescriptor().getEntityClass());
    }

    @Override
    public GenuineVariableDescriptor<Solution_> getVariableDescriptor() {
        return childSelector.getVariableDescriptor();
    }

    @Override
    protected EntitySelector<Solution_> castReplayingSelector(Object uncastReplayingSelector) {
        if (!(uncastReplayingSelector instanceof MimicReplayingEntitySelector)) {
            // In order to select a nearby value, we must first have something to be near by.
            throw new IllegalStateException("Impossible state: Nearby value selector (" + this +
                    ") did not receive a replaying entity selector (" + uncastReplayingSelector + ").");
        }
        return (EntitySelector<Solution_>) uncastReplayingSelector;
    }

    @Override
    protected AbstractNearbyDistanceMatrixDemand<?, ?, ?, ?> createDemand() {
        return new ValueNearbyDistanceMatrixDemand<>(
                nearbyDistanceMeter,
                nearbyRandom,
                childSelector,
                replayingSelector,
                this::computeDestinationSize);
    }

    private int computeDestinationSize(Object origin) {
        long childSize = childSelector.getSize(origin);
        if (childSize > Integer.MAX_VALUE) {
            throw new IllegalStateException("The childValueSelector (" + childSelector
                    + ") has a valueSize (" + childSize
                    + ") which is higher than Integer.MAX_VALUE.");
        }
        int destinationSize = (int) childSize;
        if (randomSelection) {
            // Reduce RAM memory usage by reducing destinationSize if nearbyRandom will never select a higher value
            int overallSizeMaximum = nearbyRandom.getOverallSizeMaximum();
            if (discardNearbyIndexZero && overallSizeMaximum < Integer.MAX_VALUE) {
                overallSizeMaximum++;
            }
            if (destinationSize > overallSizeMaximum) {
                destinationSize = overallSizeMaximum;
            }
        }
        return destinationSize;
    }

    // ************************************************************************
    // Worker methods
    // ************************************************************************

    @Override
    public boolean isCountable() {
        return childSelector.isCountable();
    }

    @Override
    public long getSize(Object entity) {
        return childSelector.getSize(entity) - (discardNearbyIndexZero ? 1 : 0);
    }

    @Override
    public Iterator<Object> iterator(Object entity) {
        Iterator<Object> replayingOriginEntityIterator = replayingSelector.iterator();
        if (!randomSelection) {
            return new OriginalNearbyValueIterator(nearbyDistanceMatrixSupply, replayingOriginEntityIterator,
                    childSelector.getSize(entity), discardNearbyIndexZero);
        } else {
            return new RandomNearbyIterator(nearbyDistanceMatrixSupply, nearbyRandom, workingRandom,
                    replayingOriginEntityIterator, childSelector.getSize(entity), discardNearbyIndexZero);
        }
    }

    @Override
    public Iterator<Object> endingIterator(Object entity) {
        // TODO It should probably use nearby order
        // It must include the origin entity too
        return childSelector.endingIterator(entity);
    }

}
