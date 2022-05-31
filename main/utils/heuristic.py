from abc import ABC, abstractmethod
from main.utils.entity import Entity

class Heuristic(ABC):
    def __init__(self, name: str):
        self._name = name

    def get_name(self):
        return self._name

    @abstractmethod
    def get_best_entity(self, ent1: Entity, ent2: Entity):
        raise NotImplementedError('subclasses must override get_best_entity()!')

    def __repr__(self):
        return self.get_name()

    def __str__(self):
        return self.get_name()