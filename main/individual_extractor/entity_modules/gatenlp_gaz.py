from gatenlp import Document
from gatenlp.processing.gazetteer import StringGazetteer

import text_examples
from main.utils.module import EntityModule
from main.utils.entity import Entity


class GazetteerModules:
    def __init__(self):
        # this gazetteer is a skeleton, so we will comment for test
        # add here new modules
        #gate_gazetteer = GateNlpGazetteer()

        # add modules to list
        #self._list_module = [gate_gazetteer]
        self._list_module = []

    def get_gazetteer_modules(self):
        return self._list_module


class GateNlpGazetteer(EntityModule):
    def __init__(self):
        super().__init__("GateNlpGazetteer_module")
        self.gaz = StringGazetteer()

    def add_list_of_word_for_identify_class(self, list_words: list, class_type: str):
        list_words = [(word,) for word in list_words]  # gate accetta tuple
        self.gaz.append(source=list_words, source_fmt='gazlist', list_type=class_type)

    def add_list_tuple_word_class(self, list_gaz: list, class_type: str = None):
        # trasformo in un formato accettato da gate
        # ("Parola", dict(url="link"))
        list_gaz = [(tup[0], dict(url=tup[1])) for tup in list_gaz]
        self.gaz.append(source=list_gaz, source_fmt='gazlist', list_type=class_type)

    def extract(self, input_text: str):
        doc = self.gaz(Document(input_text))
        list_entity = []
        for ent in doc.annset():
            list_entity.append(Entity(str_text=doc[ent], start_char=ent.start, end_char=ent.end,
                                      ner_type=ent.type, url=ent.features.get('url')))
        return list_entity


if __name__ == "__main__":

    gaz1 = [
        ("Obama", "https://en.wikipedia.org/wiki/Barack_Obama")
    ]

    gaz2 = ["Obama"]

    text = """l'Obama che valle delle Vesubie c'è in me"""
    gg = GateNlpGazetteer()
    gg.add_list_of_word_for_identify_class(["valle della Vesubie"], 'Valle')
    #gg.add_list_tuple_word_class(gaz1)
    print([(ent.text, ent.ner_type, ent.url) for ent in gg.extract(text_examples.sentence_test_parte_1)])
