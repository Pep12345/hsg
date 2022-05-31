from main.utils.entity import Entity
from main.utils.heuristic import Heuristic


class HeuristicsModule:
    def __init__(self):
        # add here new modules
        longer_entity_heuristic = LongerEntityHeuristic()
        # add modules to list
        self._list_module = [longer_entity_heuristic]

    def get_heuristics_list(self):
        return self._list_module


# Heuristic: return the longer matched entity between the two overlapping
class LongerEntityHeuristic(Heuristic):
    def __init__(self):
        super().__init__("long_entity_heuristic")

    def get_best_entity(self, entity1: Entity, entity2: Entity):
        if max(entity1.interval.measure, entity2.interval.measure) == entity1.interval.measure:
            return entity1
        else:
            return entity2