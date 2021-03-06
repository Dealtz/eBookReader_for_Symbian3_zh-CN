import QtQuick 1.1
import com.nokia.symbian 1.1

Column {
    id: column
    spacing: 14

    TextEdit {
        id: textEdit
        readOnly: true
        width: parent.width
        color: platformInverted ? platformStyle.colorNormalLightInverted
                                : platformStyle.colorNormalLight
        text: "<html><style type=\"text/css\">p, li { white-space: pre-wrap; } ul {margin: 0; padding: 0}</style></head>"
        +"<body><h2 align=\"center\">Руководство пользователя</h2>"
              + "<p>Программа eBookReader предназначена для просмотра электронных книг в формате FB2, FB2ZIP, EPUB (версия 2) без поддержки DRM."
              +"<h3>1. Главное окно (Библиотека)</h3>"
              +"<h4>Меню</h4><ul><li><i>Импорт</i> - импортируйте новую книгу в библиотеку. "
              +"Файлы FB2, FB2ZIP и EPUB преобразуются к формату EBR. Поддерживается импорт книги из файла, папки или мобильного телефона. "
              +"После завершения полного импорта, вы можете удалить исходные файлы, для увеличения памяти на диске. "
              +"Папки, начинающиеся с символа '.' не учитываются при экспресс импорте.</li>"
              +"<li><i>Настройки</i> - открыть окно настроек программы.</li>"
              +"<li><i>Редактировать библиотеку</i> - вы можете легко удалить книги из библиотеки.</li>"
              +"<li><i>Справка / О программе</i> - просмотреть руководство пользователя и информацию о программе.</li>"
              +"<li><i>Выход</i> - выход из программы.</li></ul>"
              +"<h4>Работа с библиотекой</h4>"
              +"<ul><li><i>Короткое нажатие на уч. запись книги</i> - открывает книгу.</li>"
              +"<li><i>Длительное нажатие на уч. запись книги</i> - открывает меню (книга).</li></ul>"
              +"<h4>Меню (книга)</h4>"
              +"<ul><li><i>Удалить</i> - удалить выбранную книгу из программы и файл книги (EBR) с диска.</li>"
              +"<li><i>Читать</i> - открыть книгу (начать чтение книги). Eсли книга имеет статус - <img src=\":/img/tb_sync\" width=16 heigth=16 />, то перед первым открытием, будет автоматически произведен её импорт.</li>"
              +"<li><i>Аннотация</i> - просмотреть аннотацию к книге.</li>"
              +"<li><i>Уч. карта ред./показать</i> - ред./показать уч. карту книги. Вы можете отредактировать библиотечную запись, но не саму книгу.</li></ul>"
              +"<h3>2. Окно чтения книги</h3>"
              +"<h4>Меню</h4>"
              +"<ul><li><i>Настройки</i> - открыть окно настроек программы.</li>"
              +"<li><i>Положение экрана</i> - выбрать положение экрана (по вертикали или горизонтали).</li>"
              +"<li><i>Вид</i> - выбор режима отображения (в темное время суток или дня, полноэкранный режим, и т.д.).</li>"
              +"<li><i>Навигация</i> - меню навигации по книге (вперёд, назад и т.д.).</li>"
              +"<li><i>Закладки</i> - меню закладок.</li>"
              +"<li><i>Выход</i> - выход из программы.</li></ul>"
              +"<h4>Работа с содержанием книги</h4>"
              +"<ul><li><i>Стрелка вниз или прокрутка содержания вниз (сенсорный экран)</i> - переход на следующую страницу.</li>"
              +"<li><i>Стрелка вверх или прокрутка содержания вверх (сенсорный экран)</i> - переход на предыдущую страницу.</li>"
              +"<li><i>Использование жеста (нажатие двумя пальцами, развести пальцы в стороны или свести пальцы вместе)</i> - изменение масштаба страницы."
              +" Масштабирование преднозначено для удобства работы с гиперссылками,"
              +" для оптимального отображения страницы используйте настройки шрифта, стиля и т.д.</li>"
              +"<li><i>Нажатие на изображение</i> - переход к просмотру изображения.</li>"
              +"<li><i>Длительное нажатие на текст</i> - активирует функцию копирования текста.</li></ul>"
              +"Если содержание не может быть отображено на одной странице, будут показаны полосы прокрутки."
              +"<h3>3. Окно настроек программы</h3>"
              +"<ul><li><i>Каталог для импорт. книг</i> - каталог для сохранения импортированных файлов.</li>"
              +"<li><i>Формат ePub</i> - переключение между оригинальными стилями файла ePub и стилем по умолчанию.</li>"
              +"<li><i>Удалять исходный файл</i> - при удалении книг также удалять исходные файлы (FB2, Zip, ePub) из телефона."
              +" Если удаляете книгу из библиотеки, но сохраняете исходный файл, то функция экспресс импорт импортирует этот файл снова.</li></ul>"
              +"<h3>4. Статус книги</h3>"
              +"При достижении конца книги, статус меняется на \"книга прочитана\" и более не изменяется."
              +"<ul><li><img src=\":/img/tb_sync\" width=16 heigth=16 /> - книга не импортирована.</li></ul>"
              +"</p></body></html>"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
    }
}
