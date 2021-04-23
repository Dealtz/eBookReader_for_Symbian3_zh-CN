import QtQuick 1.1
import com.nokia.symbian 1.1

ListModel {
    id: root

    function load()
    {
        clear();
        for(var i = 0; i < bookmarkModel.myCount(); ++i){
            append({"名称": bookmarkModel.getBookmarkName(i),
                       "uid": bookmarkModel.getUID(i),
                       "删除": false
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
