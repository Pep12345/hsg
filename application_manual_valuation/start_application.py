import json
import sys
from main.individual_extractor.individual_extractor import IndividualExtractor

from PyQt5.QtCore import Qt
from PyQt5.QtWidgets import (
    QMainWindow,
    QApplication,
    QFileDialog
)

from main.wrapper import fragment_extractor
from main_window_interface import Ui_MainWindow
from gui_utils import Row, CorrectButton, WrongButton, MyLabel, set_widow

wrong_answer = 0
correct_answer = 0


class Window(QMainWindow, Ui_MainWindow):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setupUi(self)


def clear_layout(layout):
    for i in reversed(range(layout.count())):
        layout.itemAt(i).widget().setParent(None)


def start_analysis():
    global window, main_analyzer, app
    app.setOverrideCursor(Qt.WaitCursor)

    # Using wrapper for extract fragments
    # if it's just raw text, it will generate 1 fragment without type and sources
    fragments_list = json.loads(fragment_extractor.extract_fragments(text=window.textEdit.toPlainText()))
    result_entities = []

    # for each fragment, start analysis of his text
    # analysis without params will run all extractor and the first heuristic
    for frag in fragments_list:
        result_entities += main_analyzer.start_analysis(frag['text'])

    app.restoreOverrideCursor()
    clear_layout(window.verticalLayout_3)

    # print entity extracted with class or url
    for entity in result_entities:
        if entity.ner_type is not None:
            window.verticalLayout_3.addWidget(Row([entity.text, entity.ner_type]))
        if entity.url is not None:
            link = "https://www.wikidata.org/wiki/" + entity.url
            window.verticalLayout_3.addWidget(Row([entity.text, link]))


def fake_analysis():
    clear_layout(window.verticalLayout_3)
    for i in range(1, 10):
        window.verticalLayout_3.addWidget(Row(["test", "http://test.com"]))


def open_file():
    global app
    q = QFileDialog()
    fileName, _ = QFileDialog.getOpenFileName(q,"Seleziona un testo", "","txt files (*.txt)")
    if fileName:
        f = open(fileName, "r", encoding="utf-8")
        window.textEdit.setText(f.read())

if __name__ == "__main__":
    global window, main_analyzer, app
    app = QApplication(sys.argv)
    main_analyzer = IndividualExtractor()
    window = Window()
    window.setupUi(window)
    window.actionLoad_text_from_file.triggered.connect(open_file)
    window.pushButton.clicked.connect(start_analysis)
    set_widow(window)
    window.show()
    sys.exit(app.exec_())