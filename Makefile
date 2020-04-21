# Base commands
PYTHON = python3.6
IPYTHON = ipython
JUPYTER = jupyter
PIP = pip
VIRTUALENV = $(PYTHON) -m venv
ACTIVATE = . $(VENV)/bin/activate
TR = tr
CAT = cat
SED = sed
RM = rm -fr
CP = cp
CHDIR = cd
ZIP = zip -r

ROOT = $(shell pwd)

VENV = venv3
REQUIREMENTS = requirements.txt

RUN_SERVER = $(JUPYTER) notebook

live: env
	$(ACTIVATE)  && $(RUN_SERVER)

.PHONY: env
env: $(VENV)

$(VENV):
	$(VIRTUALENV) $(VENV)
	$(CP) $(REQUIREMENTS) $(VENV)/requirements.txt
	$(ACTIVATE) && $(CHDIR) $(VENV) && $(PIP) install -r requirements.txt

.PHONY: clean
clean:
	$(RM) $(VENV)

