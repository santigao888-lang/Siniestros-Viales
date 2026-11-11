@echo off
cd /d "%~dp0"

echo Verificando dependencias...
python -c "import streamlit, pandas, joblib, sklearn" 2>nul
if errorlevel 1 (
    echo Instalando dependencias necesarias...
    python -m pip install -r requirements.txt
    if errorlevel 1 (
        echo.
        echo No se pudieron instalar las dependencias. Revisa tu instalacion de Python.
        pause
        exit /b 1
    )
)

echo.
echo Iniciando la aplicacion en http://localhost:8501 ...
echo Para detenerla, presiona Ctrl+C en esta ventana.
echo.
python -m streamlit run app.py

pause
