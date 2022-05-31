from PyQt5.QtWidgets import (
    QApplication,
    QHBoxLayout,
    QVBoxLayout,
    QPushButton,
    QWidget,
    QLabel,
    QScrollArea
)

wrong_answer = 0
correct_answer = 0


class Row(QWidget):
    def __init__(self, arguments):
        super().__init__()
        layout = QHBoxLayout()
        for arg in arguments:
            layout.addWidget(MyLabel(arg))
        layout.addWidget(CorrectButton())
        layout.addWidget(WrongButton())
        self.setLayout(layout)


class MyLabel(QLabel):
    def __init__(self, text):
        super().__init__()
        if text.startswith('http'):
            link_template = '<a href={0}>{1}</a>'
            self.setText(link_template.format(text,text))
            self.setOpenExternalLinks(True)
        else:
            self.setText(text)


class CorrectButton(QPushButton):

    def _correctClick(self):
        global correct_answer
        if self.isChecked():
            self.setStyleSheet("background-color : #66ff33")
            correct_answer += 1
        else:
            self.setStyleSheet("background-color : #d9d9d9")
            correct_answer -= 1
        update_result_label()

    def __init__(self):
        super().__init__("Correct")
        self.clicked.connect(self._correctClick)
        self.setStyleSheet("background-color : #d9d9d9")
        self.setCheckable(True)


class WrongButton(QPushButton):
    def _wrongClick(self):
        global wrong_answer
        if self.isChecked():
            self.setStyleSheet("background-color : #ff1a1a") # #9fff80
            wrong_answer += 1
        else:
            self.setStyleSheet("background-color : #d9d9d9")
            wrong_answer -= 1
        update_result_label()

    def __init__(self):
        super().__init__("Wrong")
        self.clicked.connect(self._wrongClick)
        self.setStyleSheet("background-color : #d9d9d9")
        self.setCheckable(True)


def set_widow(wid):
    global widow
    widow = wid


# TP = correct_answer
# TN = /
# FP = wrong_answer
# FN = /
def update_result_label():
    global correct_answer, wrong_answer, widow
    precision = correct_answer /(correct_answer+wrong_answer) if correct_answer != 0 else 0
    widow.precision.setText(f"precision: {str(precision)}")
