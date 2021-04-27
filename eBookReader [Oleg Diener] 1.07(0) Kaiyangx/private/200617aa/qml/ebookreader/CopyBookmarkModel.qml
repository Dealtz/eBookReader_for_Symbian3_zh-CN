import QtQuick 1.1
import com.nokia.symbian 1.1

ListModel {
    id: root

    function load()
    {
        clear();
        for(var i = 0; i < bookmarkModel.myCount(); ++i){
            append({"name": bookmarkModel.getBookmarkName(i),
                       "uid": bookmarkModel.getUID(i),
                       "deleted": false
                   });
        }        
    }

    function save()
    {
        bookmarkModel.startReset();
        try{
            for(var i = 0; i < count; ++i){
                bookmarkModel.setBookmarkName(get(i).uid, get(i).name, get(i).deleted);
            }
        }finally{
            bookmarkModel.endReset();
        }
    }
}
