from abc import ABC, abstractmethod
import uuid


class EntityModule(ABC):
    def __init__(self, name: str):
        self._id = uuid.uuid4()
        self._name = name

    def get_name(self):
        return self._name

    def __eq__(self, other):
        if isinstance(other, EntityModule):
            return other._id == self._id
        return False

    @abstractmethod
    def extract(self, text: str):
        raise NotImplementedError('subclasses must override extract()!')

    def __repr__(self):
        return self.get_name()

    def __str__(self):
        return self.get_name()