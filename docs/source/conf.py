# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'Aetherion'
copyright = '2025, Arthur Moreno'
author = 'Arthur Moreno'
release = '0.0.1'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    'breathe',
    "myst_parser",
    "sphinx.ext.autodoc",
    "sphinx.ext.napoleon",  # Optional: if you're using Google or NumPy style docstrings
    "sphinx.ext.autosummary",  # Optional: for generating summary tables
    "sphinx.ext.viewcode",  # Optional: add links to highlighted source code
    # ... any other extensions you need
    "sphinx.ext.coverage",
]

templates_path = ['_templates']
exclude_patterns = []

import os
# Adjust the path if your Doxygen XML is in a different location
breathe_projects = {
    "Aetherion": os.path.abspath("../doxygen/xml")
}
breathe_default_project = "Aetherion"

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'furo'
html_static_path = ['_static']
