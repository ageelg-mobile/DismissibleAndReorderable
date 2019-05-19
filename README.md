# reordereddismiss

A new Flutter project, showing an issue with ReorderableListView giving a GlobalKey error when draging and dropping items.
Applied solution from https://github.com/flutter/flutter/issues/21829. 

To reproduce the error,

 onReorder(oldIndex, newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    Future.delayed(Duration(milliseconds: 20), () {    //Comment to reproduce 
      setState(() {
        final Widget item = list.removeAt(oldIndex);
        list.insert(newIndex, item);
      });
    });                                               //Comment to reproduce 
  }


