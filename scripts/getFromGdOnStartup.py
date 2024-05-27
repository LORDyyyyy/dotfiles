#!/usr/bin/python3
from PyQt5.QtWidgets import QApplication, QWidget, QVBoxLayout
from PyQt5.QtWidgets import QPushButton, QLabel
from PyQt5.QtGui import QIcon
import subprocess
import sys


class SimpleMessageBox(QWidget):
    def __init__(self):
        super().__init__()

        self.init_ui()

    def init_ui(self):
        # Create widgets
        self.message_label = QLabel(
            "What command would you like to run?")
        self.syncPost = QPushButton("Sync Post")
        self.syncGet = QPushButton("Sync Get")
        self.copyPost = QPushButton("Copy Post")
        self.copyGet = QPushButton("Copy Get")
        self.cancel = QPushButton("Cancel")

        # Connect buttons to functions
        self.syncPost.clicked.connect(self.run_syncPost)
        self.syncGet.clicked.connect(self.run_syncGet)

        self.copyPost.clicked.connect(self.run_copyPost)
        self.copyGet.clicked.connect(self.run_copyGet)

        self.cancel.clicked.connect(self.close_app)

        # Set up layout
        layout = QVBoxLayout()
        layout.addWidget(self.message_label)

        layout.addWidget(self.syncPost)
        layout.addWidget(self.syncGet)
        layout.addWidget(self.copyPost)
        layout.addWidget(self.copyGet)
        layout.addWidget(self.cancel)

        self.setLayout(layout)

        # Set up window
        self.setWindowTitle("To Google Drive")
        self.setGeometry(300, 300, 300, 150)
        self.setWindowIcon(QIcon('/home/lordy/Pictures/googledrive.png'))

        self.show()

    def run_syncPost(self):
        print("Command executed!")
        command = "tmux new-session -d 'togd sync post'"
        subprocess.run(command, shell=True,
                       check=True, text=True)
        self.close()

    def run_syncGet(self):
        print("Command executed!")
        command = "tmux new-session -d 'togd sync get'"
        subprocess.run(command, shell=True,
                       check=True, text=True)
        self.close()

    def run_copyPost(self):
        print("Command executed!")
        command = "tmux new-session -d 'togd copy post'"
        subprocess.run(command, shell=True,
                       check=True, text=True)
        self.close()

    def run_copyGet(self):
        print("Command executed!")
        command = "tmux new-session -d 'togd copy get'"
        subprocess.run(command, shell=True,
                       check=True, text=True)
        self.close()

    def close_app(self):
        self.close()


if __name__ == '__main__':
    app = QApplication(sys.argv)
    window = SimpleMessageBox()
    sys.exit(app.exec_())
