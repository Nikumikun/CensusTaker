﻿
&НаКлиенте
Процедура Выход(Команда)
	Закрыть(); 
КонецПроцедуры

&НаКлиенте
Процедура Добавление(Команда)
	ПараметрЛогин = Новый Структура("Логин", Логин);
	ЭтаФорма.Закрыть();
	ОткрытьФорму("Документ.ДобавлениеДанныхГражданином.Форма.ФормаДобавленияДанныхГражданином",ПараметрЛогин);
КонецПроцедуры

&НаКлиенте
Процедура Удаление(Команда)
	ПараметрФИО = Новый Структура("ФИО",ФИОАдмина);
	ПараметрФИО.Вставить("Логин",Логин);
	ЭтаФорма.Закрыть();
	ОткрытьФорму("Документ.УдалениеДанных.Форма.ФормаУдаления",ПараметрФИО);
КонецПроцедуры

&НаКлиенте
Процедура Изменение(Команда)
	ПараметрФИО = Новый Структура("ФИО",ФИОАдмина);
	ПараметрФИО.Вставить("Логин",Логин);
	ЭтаФорма.Закрыть();
	ОткрытьФорму("Документ.ИзменениеДанных.Форма.ФормаИзмененияДанных",ПараметрФИО);
КонецПроцедуры

&НаКлиенте
Процедура Выгрузка(Команда)
	Параметр = Новый Структура("ФИО",ФИОАдмина);
	Параметр.Вставить("Логин",Логин);
	ЭтаФорма.Закрыть();
	ОткрытьФорму("Обработка.СписокОбластей.Форма.ФормаВыгрузки", Параметр);
КонецПроцедуры

&НаКлиенте
Процедура Загрузка(Команда)
	Параметр = Новый Структура("ФИО",ФИОАдмина);
	Параметр.Вставить("Логин",Логин);
	ЭтаФорма.Закрыть();
	ОткрытьФорму("Документ.ЗагрузкаДанных.Форма.ФормаЗагрузкаДанных", Параметр);
КонецПроцедуры

&НаКлиенте
Процедура НайтиСовпадение(Команда)
	Параметр = Новый Структура("ФИО",ФИОАдмина);
	Параметр.Вставить("Логин",Логин);
	ЭтаФорма.Закрыть();
	ОткрытьФорму("Документ.ЗагрузкаДанных.Форма.ФормаЗагрузкаДанных", Параметр);
КонецПроцедуры

&НаКлиенте
Процедура Подсчет(Команда)
	Параметр = Новый Структура("ФИО",ФИОАдмина);
	Параметр.Вставить("Логин",Логин);
	ЭтаФорма.Закрыть();
	ОткрытьФорму("Обработка.ПодсчетГраждан.Форма.ФормаПодсчетГраждан",Параметр);
КонецПроцедуры

&НаКлиенте
Процедура ПоискДанных(Команда)
	Параметр = Новый Структура("ФИО",ФИОАдмина);
	Параметр.Вставить("Логин",Логин);
	ЭтаФорма.Закрыть();
	ОткрытьФорму("Документ.ПоискГраждан.Форма.ФормаПоискаДанных",Параметр);
КонецПроцедуры

&НаКлиенте
Процедура ВыводДругихДанных(Команда)
	Параметр = Новый Структура("ФИО",ФИОАдмина);
	Параметр.Вставить("Логин",Логин);
	ЭтаФорма.Закрыть();
	ОткрытьФорму("Обработка.ВыводОстальныхДанных.Форма.ФормаВыводаДругихДанных",Параметр);
КонецПроцедуры

&НаКлиенте
Процедура СохранитьИсторию(Команда)
	СохранитьИсториюНаСервере();
	Сообщить("Сохранение завершено, проверьте C:\Users\Public\Documents\history.txt");
КонецПроцедуры

&НаСервере
Функция СохранитьИсториюНаСервере()
	Запрос0 = Новый Запрос;
	Запрос0.Текст = "ВЫБРАТЬ
	                |	Авторизация.Дата КАК Дата,
	                |	Авторизация.ИмяДокумента КАК ИмяДокумента,
	                |	Авторизация.Авторизировался КАК Авторизировался
	                |ИЗ
	                |	Документ.Авторизация КАК Авторизация";
	Выборка0 = Запрос0.Выполнить().Выбрать();
	Запрос = Новый Запрос;
	Запрос.Текст = "ВЫБРАТЬ
	               |	ДобавлениеДанныхГражданином.Дата КАК Дата,
	               |	ДобавлениеДанныхГражданином.ИмяДокумента КАК ИмяДокумента,
	               |	ДобавлениеДанныхГражданином.Добавил КАК Добавил,
	               |	ДобавлениеДанныхГражданином.СсылкаНаГражданина.ФИО КАК СсылкаНаГражданинаФИО
	               |ИЗ
	               |	Документ.ДобавлениеДанныхГражданином КАК ДобавлениеДанныхГражданином";
	Выборка = Запрос.Выполнить().Выбрать();
	Запрос1 = Новый Запрос;
	Запрос1.Текст = "ВЫБРАТЬ
	                |	ВыгрузкаДанных.Дата КАК Дата,
	                |	ВыгрузкаДанных.ИмяДокумента КАК ИмяДокумента,
	                |	ВыгрузкаДанных.Выгрузил КАК Выгрузил,
	                |	ВыгрузкаДанных.КоличествоЗаписей КАК КоличествоЗаписей
	                |ИЗ
	                |	Документ.ВыгрузкаДанных КАК ВыгрузкаДанных";
	Выборка1 = Запрос1.Выполнить().Выбрать();
	Запрос2 = Новый Запрос;
	Запрос2.Текст = "ВЫБРАТЬ
	                |	УдалениеДанных.Дата КАК Дата,
	                |	УдалениеДанных.ИмяДокумента КАК ИмяДокумента,
	                |	УдалениеДанных.Удалил КАК Удалил,
	                |	УдалениеДанных.Гражданин КАК Гражданин
	                |ИЗ
	                |	Документ.УдалениеДанных КАК УдалениеДанных";
	Выборка2 = Запрос2.Выполнить().Выбрать();
	Запрос3 = Новый Запрос;
	Запрос3.Текст = "ВЫБРАТЬ
	                |	ИзменениеДанных.Дата КАК Дата,
	                |	ИзменениеДанных.ИмяДокумента КАК ИмяДокумента,
	                |	ИзменениеДанных.Изменил КАК Изменил,
	                |	ИзменениеДанных.Гражданин.ФИО КАК ГражданинФИО
	                |ИЗ
	                |	Документ.ИзменениеДанных КАК ИзменениеДанных";
	Выборка3 = Запрос3.Выполнить().Выбрать();
	Запрос4 = Новый Запрос;
	Запрос4.Текст = "ВЫБРАТЬ
	                |	ИзменениеДанных.Дата КАК Дата,
	                |	ИзменениеДанных.ИмяДокумента КАК ИмяДокумента,
	                |	ИзменениеДанных.Изменил КАК Изменил,
	                |	ИзменениеДанных.Гражданин.ФИО КАК ГражданинФИО
	                |ИЗ
	                |	Документ.ИзменениеДанных КАК ИзменениеДанных";
	Выборка4 = Запрос4.Выполнить().Выбрать();
	Запрос5 = Новый Запрос;
	Запрос5.Текст = "ВЫБРАТЬ
	                |	НайтиСовпадение.Дата КАК Дата,
	                |	НайтиСовпадение.ИмяДокумента КАК ИмяДокумента,
	                |	НайтиСовпадение.Искал КАК Искал
	                |ИЗ
	                |	Документ.НайтиСовпадение КАК НайтиСовпадение";
	Выборка5 = Запрос5.Выполнить().Выбрать(); 
	Запрос6 = Новый Запрос;
	Запрос6.Текст = "ВЫБРАТЬ
	                |	ЗагрузкаДанных.Дата КАК Дата,
	                |	ЗагрузкаДанных.ИмяДокумента КАК ИмяДокумента,
	                |	ЗагрузкаДанных.Загрузил КАК Загрузил,
	                |	ЗагрузкаДанных.ЧислоЗаписей КАК ЧислоЗаписей
	                |ИЗ
	                |	Документ.ЗагрузкаДанных КАК ЗагрузкаДанных";
	Выборка6 = Запрос6.Выполнить().Выбрать();
	Запрос7 = Новый Запрос;
	Запрос7.Текст = "ВЫБРАТЬ
	                |	ПодсчетГраждан.Дата КАК Дата,
	                |	ПодсчетГраждан.ИмяДокумента КАК ИмяДокумента,
	                |	ПодсчетГраждан.Подсчитал КАК Подсчитал,
	                |	ПодсчетГраждан.КоличествоПодсчитанных КАК КоличествоПодсчитанных
	                |ИЗ
	                |	Документ.ПодсчетГраждан КАК ПодсчетГраждан";
	Выборка7 = Запрос7.Выполнить().Выбрать();  
	Запрос8 = Новый Запрос;
	Запрос8.Текст = "ВЫБРАТЬ
	                |	ПоискГраждан.Дата КАК Дата,
	                |	ПоискГраждан.ИмяДокумента КАК ИмяДокумента,
	                |	ПоискГраждан.Искал КАК Искал,
	                |	ПоискГраждан.ПоискПо КАК ПоискПо
	                |ИЗ
	                |	Документ.ПоискГраждан КАК ПоискГраждан";
	Выборка8 = Запрос8.Выполнить().Выбрать();
	Запрос9 = Новый Запрос;
	Запрос9.Текст = "ВЫБРАТЬ
	                |	ВыводДругихДанных.Дата КАК Дата,
	                |	ВыводДругихДанных.ИмяДокумента КАК ИмяДокумента,
	                |	ВыводДругихДанных.Искал КАК Искал,
	                |	ВыводДругихДанных.ФильтрПоиска КАК ФильтрПоиска
	                |ИЗ
	                |	Документ.ВыводДругихДанных КАК ВыводДругихДанных";
	Выборка9 = Запрос9.Выполнить().Выбрать();
	Запрос10 = Новый Запрос;
	Запрос10.Текст = "ВЫБРАТЬ
	                 |	СохранениеИстории.Дата КАК Дата,
	                 |	СохранениеИстории.ИмяДокумента КАК ИмяДокумента,
	                 |	СохранениеИстории.Сохранил КАК Сохранил
	                 |ИЗ
	                 |	Документ.СохранениеИстории КАК СохранениеИстории";
	Выборка10 = Запрос10.Выполнить().Выбрать();
	Запрос11 = Новый Запрос;
	Запрос11.Текст = "ВЫБРАТЬ
	                 |	СозданиеСотрудника.Дата КАК Дата,
	                 |	СозданиеСотрудника.ИмяДокумента КАК ИмяДокумента,
	                 |	СозданиеСотрудника.Создал КАК Создал,
	                 |	СозданиеСотрудника.ЛогинНовогоСотрудника КАК ЛогинНовогоСотрудника
	                 |ИЗ
	                 |	Документ.СозданиеСотрудника КАК СозданиеСотрудника";
	Выборка11 = Запрос11.Выполнить().Выбрать();
	
	Текст = Новый ЗаписьТекста("C:\Users\Public\Documents\history.txt",КодировкаТекста.ANSI);
	Пока Выборка0.Следующий() Цикл
		Текст.ЗаписатьСтроку(Строка(Выборка0.Дата)+" "+Строка(Выборка0.ИмяДокумента)+
		" "+Строка(Выборка0.Авторизировался));
	КонецЦикла;
	Пока Выборка.Следующий() Цикл
		Текст.ЗаписатьСтроку(Строка(Выборка.Дата)+" "+Строка(Выборка.ИмяДокумента)+
		" "+Строка(Выборка.Добавил)+" "+Строка(Выборка.СсылкаНаГражданинаФИО));
	КонецЦикла;
	Пока Выборка1.Следующий() Цикл
		Текст.ЗаписатьСтроку(Строка(Выборка1.Дата)+" "+Строка(Выборка1.ИмяДокумента)+
		" "+Строка(Выборка1.Выгрузил)+" "+Строка(Выборка1.КоличествоЗаписей));
	КонецЦикла;
	Пока Выборка2.Следующий() Цикл
		Текст.ЗаписатьСтроку(Строка(Выборка2.Дата)+" "+Строка(Выборка2.ИмяДокумента)+
		" "+Строка(Выборка2.Удалил)+" "+Строка(Выборка2.Гражданин));
	КонецЦикла;
	Пока Выборка3.Следующий() Цикл
		Текст.ЗаписатьСтроку(Строка(Выборка3.Дата)+" "+Строка(Выборка3.ИмяДокумента)+
		" "+Строка(Выборка3.Изменил)+" "+Строка(Выборка3.ГражданинФИО));
	КонецЦикла;
	Пока Выборка4.Следующий() Цикл
		Текст.ЗаписатьСтроку(Строка(Выборка4.Дата)+" "+Строка(Выборка4.ИмяДокумента)+
		" "+Строка(Выборка4.Изменил)+" "+Строка(Выборка4.ГражданинФИО));
	КонецЦикла;
	Пока Выборка5.Следующий() Цикл
		Текст.ЗаписатьСтроку(Строка(Выборка5.Дата)+" "+Строка(Выборка5.ИмяДокумента)+
		" "+Строка(Выборка5.Искал));
	КонецЦикла;
	Пока Выборка6.Следующий() Цикл
		Текст.ЗаписатьСтроку(Строка(Выборка6.Дата)+" "+Строка(Выборка6.ИмяДокумента)+
		" "+Строка(Выборка6.Загрузил)+" "+Строка(Выборка6.ЧислоЗаписей));
	КонецЦикла;
	Пока Выборка7.Следующий() Цикл
		Текст.ЗаписатьСтроку(Строка(Выборка7.Дата)+" "+Строка(Выборка7.ИмяДокумента)+
		" "+Строка(Выборка7.Подсчитал)+" "+Строка(Выборка7.КоличествоПодсчитанных));
	КонецЦикла;
	Пока Выборка8.Следующий() Цикл
		Текст.ЗаписатьСтроку(Строка(Выборка8.Дата)+" "+Строка(Выборка8.ИмяДокумента)+
		" "+Строка(Выборка8.Искал)+" "+Строка(Выборка8.ПоискПо));
	КонецЦикла;
	Пока Выборка9.Следующий() Цикл
		Текст.ЗаписатьСтроку(Строка(Выборка9.Дата)+" "+Строка(Выборка9.ИмяДокумента)+
		" "+Строка(Выборка9.Искал)+" "+Строка(Выборка9.ФильтрПоиска));
	КонецЦикла;
	Пока Выборка10.Следующий() Цикл
		Текст.ЗаписатьСтроку(Строка(Выборка10.Дата)+" "+Строка(Выборка10.ИмяДокумента)+
		" "+Строка(Выборка10.Сохранил));
	КонецЦикла;
	Пока Выборка11.Следующий() Цикл
		Текст.ЗаписатьСтроку(Строка(Выборка11.Дата)+" "+Строка(Выборка11.ИмяДокумента)+
		" "+Строка(Выборка11.Создал)+" "+Строка(Выборка11.ЛогинНовогоСотрудника));
	КонецЦикла;
	Текст.Закрыть();
	ДокументСохранения = Документы.СохранениеИстории.СоздатьДокумент();
	ДокументСохранения.Дата = ТекущаяДата();
	ДокументСохранения.ИмяДокумента = "Сохранение записей";
	ДокументСохранения.Сохранил = Логин;
	ДокументСохранения.Записать();
	
КонецФункции


&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Перем ЛогинПользователя, СотрудникСправочник;
	ЛогинПользователя = Параметры.Логин;
	Логин = ЛогинПользователя;
	СотрудникСправочник = Справочники.Сотрудник.НайтиПоРеквизиту("Логин",ЛогинПользователя).Ссылка;
	ФИОАдмина = Справочники.ДанныеОГражданине.НайтиПоРеквизиту("Код_СправочникаСотрудник",СотрудникСправочник).ФИО;
КонецПроцедуры 

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	ЗаполнениеТаблицы();
КонецПроцедуры

&НаСервере
Процедура ЗаполнениеТаблицы()
	Запрос = Новый Запрос();
	Запрос.Текст = "ВЫБРАТЬ
	               |	ДанныеОГражданине.ФИО КАК ФИО,
	               |	ДанныеОГражданине.Код_СправочникаСотрудник КАК Код_СправочникаСотрудник,
	               |	ДанныеОГражданине.Код_СправочникАдрес КАК Код_СправочникАдрес,
	               |	ДанныеОГражданине.Код_СправочникаПерсональныеДанные КАК Код_СправочникаПерсональныеДанные,
	               |	ДанныеОГражданине.Код_СправочникаСоциальныеДанные КАК Код_СправочникаСоциальныеДанные,
	               |	ДанныеОГражданине.Код_СправочникаДанныеСемьи КАК Код_СправочникаДанныеСемьи,
	               |	ДанныеОГражданине.Код_СправочнниаДанныеОСтране КАК Код_СправочнниаДанныеОСтране,
	               |	ДанныеОГражданине.Код_СправочникаНациональности КАК Код_СправочникаНациональности,
	               |	ДанныеОГражданине.Код_СправочникаВопросы КАК Код_СправочникаВопросы
	               |ИЗ
	               |	Справочник.ДанныеОГражданине КАК ДанныеОГражданине";
	Результат = Запрос.Выполнить();
	Таблица = Результат.Выгрузить(ОбходРезультатаЗапроса.Прямой);
	ВывестиТаблицуЗначенияВКодеВТаблицуНаФорме(Таблица, "ДанныеГраждан", "Таблица1");
КонецПроцедуры

 &НаСервере
Процедура ВывестиТаблицуЗначенияВКодеВТаблицуНаФорме(ТабВКоде, ТабРеквизит, ТабНаФорме) 
    НовыеРеквизиты = Новый Массив;
	Для Каждого Колонка Из ТабВКоде.Колонки Цикл
         НовыеРеквизиты.Добавить(
            Новый РеквизитФормы(
                Колонка.Имя, Колонка.ТипЗначения,
                ТабРеквизит));
    КонецЦикла;
    ИзменитьРеквизиты(НовыеРеквизиты);
    Для Каждого Колонка Из ТабВКоде.Колонки Цикл
        НовыйЭлемент = Элементы.Добавить(
            ТабРеквизит + "_" + Колонка.Имя, Тип("ПолеФормы"), Элементы[ТабНаФорме]);
        НовыйЭлемент.Вид = ВидПоляФормы.ПолеВвода;
        НовыйЭлемент.ПутьКДанным = ТабРеквизит + "." + Колонка.Имя;
    КонецЦикла;
    ЗначениеВРеквизитФормы(ТабВКоде, ТабРеквизит); 
КонецПроцедуры


&НаКлиенте
Процедура СозданиеСотрудника(Команда)
	Параметр = Новый Структура("ФИО",ФИОАдмина);
	Параметр.Вставить("Логин",Логин);
	ЭтаФорма.Закрыть();
	ОткрытьФорму("Документ.СозданиеСотрудника.Форма.ФормаСозданияСотрудника",Параметр);
КонецПроцедуры

