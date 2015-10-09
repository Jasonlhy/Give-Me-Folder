# Give-Me-Folder
A small shell script which is used to organize files in folders with their filename patterns

I am a lazy person and I like to save many files especially screen captures into one messy single folder. 
However, I hate to organize the files by draging them into different folders and rename them one by one.
As inspired by the Amazon online storage, the shell script is to organize files into folders with levels.
By default, it uses the "," to separate levels.

For example, a folder contains following files: 
* note.docx
* projectA,requirement.docx
* projectA,plan.docx
* projectA,graph,usecase.png
* projectA,graph,sequence.png

After the shell script is executed, the folder will looks like

```
Current Directory
│   note.docx
│
└───projectA
    │   requirement.docx
    |   plan.docx
    │
    ├───graph
    │   │   usecase.png
    │   │   sequence.png
    │   │   ...
```
