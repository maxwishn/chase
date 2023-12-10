WIN = windows
LIN = linux
WEB_PATH = web_version/src
WEB_ENGINE_PATH = C:\osweb
WEB_ENGINE_EXE = $(WEB_ENGINE_PATH)\OneScript.WebHost.exe
OSCRIPT_PATH = C:\Program Files\OneScript
OSCRIPT_EXE = $(OSCRIPT_PATH)\bin\oscript.exe

windows:
	mkdir $(WIN)
	"$(OSCRIPT_EXE)" -make chase.os ./$(WIN)/chase.exe
	./$(WIN)/chase.exe

linux:
	mkdir $(LIN)
	"$(OSCRIPT_EXE)" -make chase.os ./$(LIN)/chase.exe
	./$(LIN)/chase.exe

web:
	cd "$(WEB_PATH)" && $(WEB_ENGINE_EXE)

clean:
	rm -rf $(WIN)
	rm -rf $(LIN)