import os

from {{cookiecutter.project_slug}}.__version__ import VERSION
from setuptools import find_packages
from setuptools import setup


def local_file(path: str) -> str:
    return os.path.relpath(
        os.path.join(
            os.path.dirname(__file__),
            path,
        ),
    )


with open(local_file('README.md')) as f:
    long_description = f.read()


with open(local_file('requirements-minimal.txt')) as f:
    requirements = f.readlines()


setup(
    name='{{ cookiecutter.project_slug }}',
    packages=find_packages(exclude=(['test*', 'tmp*'])),
    version=VERSION,
    description='{{ cookiecutter.description }}',
    long_description=long_description,
    long_description_content_type='text/markdown',
    author='{{ cookiecutter.author_name }}',
    author_email='{{ cookiecutter.author_email }}',
    install_requires=requirements,

    # TODO: url
    # TODO: entry_points, if appropriate
    # TODO: add classifiers
    # TODO: keywords
)
