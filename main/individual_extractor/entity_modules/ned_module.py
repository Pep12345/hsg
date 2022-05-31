import textrazor
from main.utils.module import EntityModule
from main.utils.entity import Entity

text_razor_api_kei = 'e68f32b3a954163114a4edb7265d13dd1a41e92ceeca99002033722f'


class NedModules:
    def __init__(self):
        # add here new modules
        text_razor_module = TextRazorModule(text_razor_api_kei)
        # add modules to list
        self._list_module = [text_razor_module]

    def get_ned_modules(self):
        return self._list_module


#### NED MODULES ####
# Each module contain a method "extract" that take in input a text and return a list of object Entity


class TextRazorModule(EntityModule):
    def __init__(self, api_key):
        super().__init__("text_razor_module")
        textrazor.api_key = api_key
        self.client = textrazor.TextRazor(extractors=["entities"])
        self.client.set_language_override('ita')

    def extract(self, text):
        try:
            response = self.client.analyze(text)
        except textrazor.TextRazorAnalysisException as ex:
            print("Failed to analyze with error: ", ex)
            return []
        return [Entity(str_text=ent.json.get('matchedText'), url=ent.json.get('wikidataId'),
                       start_char=ent.json['startingPos'], end_char=ent.json['endingPos'])
                for ent in response.entities()]



#### TODO:DA CANCELLARE
if __name__ == "__main__":
    s =   '''La chiesa della confraternita viene edificata nel 1538, segno dell’affermazione di un notabilato che controlla la vita economica e sociale della comunità e sviluppatosi tra la metà del Quattrocento e la fine del Cinquecento, a seguito dell’incremento dei traffici commerciali. La rete economica favorisce anche la circolazione di artisti.
I confratelli di Santa Croce commissionano (1658 - 1660) un ciclo di dodici tele a Lorenzo Gastaldi.
La scelta del pittore, che in quel momento si trova a Monaco, e realizza molte opere per le valli del Nizzardo e il basso cuneese, si spiega con interessi economici della comunità e alle frequentazioni liguri-nizzarde della popolazione locale.  Durante il Seicento gli entracquesi vendono ovini e bovini ai macelli di Grasse, Nizza e Genova. Sovente  alcuni abitanti si recavano per affari a Tenda, raggiunta attraverso i colli della Finestra e del Sabbione. A partire dagli anni Settanta del Seicento è potenziata l’attività mercantile, a cui corrisponde il tentativo di rilanciare l’antica strada del colle delle Finestre, che in seguito al potenziamento della strada del colle di Tenda aveva perso la sua importanza.
I rapporti di Entracque con la valle della Vesubie, attraverso il colle delle Finestre, sulla strada di Nizza, determinarono almeno un altro episodio di committenza: il “mastro da bosco” (falegname) Giacomo Rosso di Lantosca realizza nel 1684 un armadio per la parrocchiale di Sant’Antonino.'''
    ned = NedModules()
    from pprint import pprint
    text_razor = ned.get_ned_modules()[0]
    pprint([(ent.start_char,ent.text,ent.wikidata_id) for ent in text_razor.extract(s)])