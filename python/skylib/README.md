
# Update dependencies
https://stackoverflow.com/questions/62885911/pip-freeze-creates-some-weird-path-instead-of-the-package-version

```bash
poetry add pybind

poetry update 
poetry run pip list --format=freeze > requirements.txt
```
