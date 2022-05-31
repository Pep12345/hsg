from main.utils.entity import Entity

class Triple:
    def __init__(self, verb_text: str, arg0: Entity, arg1: Entity, url=None):
        self.verb_text = verb_text
        self.url = url
        self.arg0 = arg0
        self.arg1 = arg1
        self.negative = False
        self.passive = False

    def __repr__(self):
        return str(self.__str__())

    def __str__(self):
        return f"({self.arg0},{self.verb_text},{self.arg1})"

    def set_passive(self):
        self.passive = True

    def set_negative(self):
        self.negative = True

    def set_not_passive(self):
        self.passive = False

    def set_not_negative(self):
        self.negative = False