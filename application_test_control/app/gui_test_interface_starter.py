import sys
from qdialog import Ui_Dialog
from application_test_control.code.tester import Tester
from PyQt5.QtCore import Qt, QRect
from PyQt5 import QtGui, QtCore
from PyQt5.QtWidgets import (
    QMainWindow,
    QApplication,
    QPushButton,
    QWidget,
    QHBoxLayout,
    QLabel,
    QTableWidgetItem,
    QHeaderView,
    QDialog
)
from application_test_control.app.test_interface import Ui_MainWindow


class Window(QMainWindow, Ui_MainWindow):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setupUi(self)

class PopUpDialog(QDialog):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.ui = Ui_Dialog()
        self.ui.setupUi(self)


class PopUpButton(QPushButton):

    def _show_pop_up(self):
        qdialog = PopUpDialog(window)
        listview = qdialog.ui.listView
        model = QtGui.QStandardItemModel()
        listview.setModel(model)
        for elem in self._result:
            item = QtGui.QStandardItem(str(elem))
            model.appendRow(item)
        qdialog.exec_()

    def __init__(self, list_result):
        super().__init__("Show")
        self._result = list_result
        self.clicked.connect(self._show_pop_up)


## on/off switch
class MySwitch(QPushButton):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.__name = parent.text()
        self.setCheckable(True)
        self.setMinimumWidth(66)
        self.setMinimumHeight(22)
        self.setChecked(True)
        self.clicked.connect(self.select_module)

    def paintEvent(self, event):
        label = "ON" if self.isChecked() else "OFF"
        bg_color = Qt.green if self.isChecked() else Qt.red

        radius = 10
        width = 32
        center = self.rect().center()

        painter = QtGui.QPainter(self)
        painter.setRenderHint(QtGui.QPainter.Antialiasing)
        painter.translate(center)
        painter.setBrush(QtGui.QColor(0,0,0))

        pen = QtGui.QPen(Qt.black)
        pen.setWidth(2)
        painter.setPen(pen)

        painter.drawRoundedRect(QRect(-width, -radius, 2*width, 2*radius), radius, radius)
        painter.setBrush(QtGui.QBrush(bg_color))
        sw_rect = QRect(-radius, -radius, width + radius, 2*radius)
        if not self.isChecked():
            sw_rect.moveLeft(-width)
        painter.drawRoundedRect(sw_rect, radius, radius)
        painter.drawText(sw_rect, Qt.AlignCenter, label)

    def select_module(self):
        if self.isChecked():
            print("activing module ", self.__name)
            tester_main.turn_on_module(module_name=self.__name)
        else:
            print("deactiving module ", self.__name)
            tester_main.turn_off_module(module_name=self.__name)


# class for module rows: name - on/off switch
class ModuleRow(QWidget):
    def __init__(self, module_list, parent=None):
        super().__init__(parent)
        model = QtGui.QStandardItemModel()
        for module in module_list:
            layout = QHBoxLayout()
            label = QLabel()
            label.setAlignment(QtCore.Qt.AlignCenter)
            label.setText(module.get_name())
            layout.addWidget(label)
            layout.addWidget(MySwitch(parent=label))
            window.modules_layout.addLayout(layout)


# adding heuristic to combobox
def add_heuristics_items_in_combo_box(heuristic_list):
    for heuristic in heuristic_list:
        window.comboBox.addItem(heuristic.get_name())
    window.comboBox.currentIndexChanged.connect(selection_change)


# method for heuristic change
def selection_change():
    tester_main.select_heuristic(heuristic_name=window.comboBox.currentText())


# add row for result table, column:
#               ner type, precision, recall, f1 score, metrics, result numbers, list popup
def add_row_to_table(args, color):
    table = window.tableWidget
    row_index = table.rowCount()
    table.insertRow(row_index)
    i = 0

    for arg in args[:-1]:
        if isinstance(arg, float):
            arg = '%.3f' % arg
        table.setItem(row_index, i, QTableWidgetItem(str(arg)))
        table.item(row_index, i).setBackground(color)
        i += 1
    popup = PopUpButton(args[-1])
    table.setCellWidget(row_index, i, popup)
    i += 1


def clear_table():
    window.tableWidget.setRowCount(0) # clear table


def _resize_table_column():
    header = window.tableWidget.horizontalHeader()
    header.setSectionResizeMode(4, QHeaderView.Stretch)
    header.setSectionResizeMode(0, QHeaderView.ResizeToContents)
    header.setSectionResizeMode(1, QHeaderView.ResizeToContents)
    header.setSectionResizeMode(2, QHeaderView.ResizeToContents)
    header.setSectionResizeMode(3, QHeaderView.ResizeToContents)


# start button
def start_button_action():
    # colore per cambiare tra start e l'altro
    global last_row_colored
    color = QtGui.QColor(181, 230, 221) if last_row_colored else QtGui.QColor(247, 193, 206)
    last_row_colored = not last_row_colored
    try:
        app.setOverrideCursor(Qt.WaitCursor) # cambia cursore in waiting
        result_list = tester_main.start_test()
        for r in result_list:
            print(f"{r[0]}, {'%.3f' %r[1]}, {'%.3f' %r[2]}, {'%.3f' %r[3]}, {r[4]}")
            add_row_to_table(r, color)
        _resize_table_column()
    except Exception as e:
        print(e)
    finally:
        app.restoreOverrideCursor()

if __name__ == "__main__":
    global window, main_analyzer, app
    global active_modules, list_module, tester_main, last_row_colored
    last_row_colored = False
    app = QApplication(sys.argv)
    window = Window()
    window.setupUi(window)

    tester_main = Tester()
    #connect clear table
    window.action_clear_table.triggered.connect(clear_table)
    # load module list
    rows_widget = ModuleRow(tester_main.get_list_modules())
    # load heuristic list
    add_heuristics_items_in_combo_box(tester_main.get_list_heuristic())
    # connect start button
    window.start_analysis_button.clicked.connect(start_button_action)
    window.show()
    sys.exit(app.exec_())
