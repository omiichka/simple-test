# Few small interview tasks

1. Реализуйте метод загрузки картинки в ячейку таблицы: Сигнатура метода: func downloadImage(withURL url: URL, forCell cell: UITableViewCell)
Таблица должна выводить список из 100 картинок. Ссылка на картинку формируется так: http://placehold.it/375x150?text={index}, где index - порядковый номер ячейки (например, http://placehold.it/375x150?text=1, http://placehold.it/375x150?text=2, и т.д). В данной задаче запрещается использовать сторонние бибилиотеки. Язык программирования Swift 5

2. Объясните почему блок "Work 2" не выполняется?
let serialQueue = DispatchQueue(label: "com.foo.bar") 
serialQueue.async { 
  print("Work 1") 
  serialQueue.sync { 
    print("Work 2")
  }
 }

3. Напишите консольное приложение, которое запрашивает никнейм и получает по нему список репозиториев из Github. Полученный список репозиториев выводится на экран терминала в виде списка имен репозиториев. Для запросов в сеть нужно использовать Alamofire! Для доступа к Github использовать официальный API https://developer.github.com/v3/ Язык программирования Swift 5

4. Напишите код, проверяющий, соответствует ли логин следующим правилам: логин может быть как email-ом так и обычной строкой (никнейм). Минимальная длина логина - 3 символа, максимальная - 32. Логин может состоять из латинских букв, цифр, минуса и точки. Логин не может начинаться на цифру, точку, минус. Код должен быть покрыт Unit-тестами. Язык программирования Swift 5
