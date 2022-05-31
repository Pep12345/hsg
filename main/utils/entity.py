from sympy import Interval

class Entity:
    def __init__(self, str_text: str, start_char: int, end_char: int, ner_type=None, url=None):
        self.text = str_text
        self.start_char = start_char
        self.end_char = end_char
        self.interval = Interval(self.start_char, self.end_char)
        self.ner_type = ner_type
        self.url = url

    def __repr__(self):
        return str(self.__str__())

    def __str__(self):
        return f"<text: {self.text}, interval: {self.interval}, Type: {self.ner_type}, Url: {self.url}>"
