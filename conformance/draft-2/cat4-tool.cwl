#!/usr/bin/env cwl-runner
{
    "@context": "https://raw.githubusercontent.com/common-workflow-language/common-workflow-language/master/schemas/draft-2/cwl-context.json",
    "class": "CommandLineTool",

    "description": "Print the contents of a file to stdout using 'cat' running in a docker container.",
    "hints": [
        {
          "class": "DockerRequirement",
          "dockerPull": "debian:wheezy"
        }
    ],
    "inputs": [
        {
            "id": "#file1",
            "type": "File"
        }
    ],
    "outputs": [
        {
            "id": "#output.txt",
            "type": "File",
            "outputBinding": {
              "glob": "output.txt"
              }
        }
    ],
    "baseCommand": "cat",
    "stdout": "output.txt",
    "stdin": {
      "class": "Expression",
      "engine": "JsonPointer",
      "script": "job/file1/path"
      }
}
