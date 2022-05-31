import queue
from main.utils.heuristic import Heuristic
from main.utils.entity import Entity
from sympy import Interval, Union


class EntityGroup:
    def __init__(self, heuristic: Heuristic):
        self.queue = queue.Queue()
        self._heuristic = heuristic

    def add_elem(self, elem: Entity):
        self.queue.put(elem)

    def _check_intersection(self, entity1, entity2):
        return not entity1.interval.intersect(entity2.interval).is_empty

    def extract_entities(self):
        list_result = [self.queue.get()]
        while not self.queue.empty():
            element = self.queue.get()
            for r in list_result:
                if self._check_intersection(r, element):
                    list_result.remove(r)
                    best_entity = self._heuristic.get_best_entity(r, element)
                    list_result.append(best_entity)
        return list_result


# metodo che unisce le entità che si sovrappongono, input/output: lista entità
def union(entity_list, heuristic):
    # estraggo lista con tutti gli intervalli delle entità
    intervals = [ent.interval for ent in entity_list]
    # creo sets di intersezioni (esempio (1,2)(2,3)(5,6)(6,7) -> (1,3)(5,7))
    u = Union(*intervals)
    merged_list_of_intervals = [list(u.args[:2])] if isinstance(u, Interval) else list(u.args)

    # creo un entitygroup per ogni set di intersezione e lo riempo con le sue menzioni
    entity_groups = []
    for un in merged_list_of_intervals:
        eg = EntityGroup(heuristic)
        entity_groups.append(eg)
        for ent in entity_list:
            #Se l'entità interseca e quindi appartiene a questa union:

            if not isinstance(un, Interval):
                un = Interval(un[0], un[1])
            if not ent.interval.intersect(un).is_empty:
                eg.add_elem(ent)

    list_result = []
    # estraggo la/le migliore/i entità per ogni entity group seguendo l'euristica in input
    for e in entity_groups:
        list_result += e.extract_entities()
    return list_result
