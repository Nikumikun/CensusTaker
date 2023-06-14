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
	ПараметрФИО = Новый Структура("ФИО",ФИОСотрудника);
	ПараметрФИО.Вставить("Логин",Логин);
	ЭтаФорма.Закрыть();
	ОткрытьФорму("Документ.УдалениеДанных.Форма.ФормаУдаления",ПараметрФИО);
КонецПроцедуры

&НаКлиенте
Процедура Изменение(Команда)
	ПараметрФИО = Новый Структура("ФИО",ФИОСотрудника);
	ПараметрФИО.Вставить("Логин",Логин);
	ЭтаФорма.Закрыть();
	ОткрытьФорму("Документ.ИзменениеДанных.Форма.ФормаИзмененияДанных",ПараметрФИО);
КонецПроцедуры

&НаКлиенте
Процедура Выгрузка(Команда)
	Параметр = Новый Структура("ФИО",ФИОСотрудника);
	Параметр.Вставить("Логин",Логин);
	ЭтаФорма.Закрыть();
	ОткрытьФорму("Обработка.СписокОбластей.Форма.ФормаВыгрузки", Параметр);
КонецПроцедуры

&НаКлиенте
Процедура Загрузка(Команда)
	Параметр = Новый Структура("ФИО",ФИОСотрудника);
	Параметр.Вставить("Логин",Логин);
	ЭтаФорма.Закрыть();
	ОткрытьФорму("Документ.ЗагрузкаДанных.Форма.ФормаЗагрузкаДанных", Параметр);
КонецПроцедуры

&НаКлиенте
Процедура НайтиСовпадение(Команда)
	Параметр = Новый Структура("ФИО",ФИОСотрудника);
	Параметр.Вставить("Логин",Логин);
	ЭтаФорма.Закрыть();
	ОткрытьФорму("Обработка.СписокТаблиц.Форма.ФормаНайтиСовпадений", Параметр);
КонецПроцедуры

&НаКлиенте
Процедура Подсчет(Команда)
	// Вставить содержимое обработчика.
КонецПроцедуры

&НаКлиенте
Процедура ПоискДанных(Команда)
	// Вставить содержимое обработчика.
КонецПроцедуры

&НаКлиенте
Процедура ВыводДругихДанных(Команда)
	// Вставить содержимое обработчика.
КонецПроцедуры

&НаКлиенте
Процедура СохранитьИсторию(Команда)
	// Вставить содержимое обработчика.
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Перем ЛогинПользователя, СотрудникСправочник;
	ЛогинПользователя = Параметры.Логин;
	Логин = ЛогинПользователя;
	СотрудникСправочник = Справочники.Сотрудник.НайтиПоРеквизиту("Логин",ЛогинПользователя).Ссылка;
	ФИОСотрудника = Справочники.ДанныеОГражданине.НайтиПоРеквизиту("Код_СправочникаСотрудник",СотрудникСправочник).ФИО;
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
	               |	ДанныеОГражданине.Код_СправочникаСотрудник КАК ДанныеСотрудника,
	               |	ДанныеОГражданине.Код_СправочникАдрес КАК ДанныеОбАдрес,
	               |	ДанныеОГражданине.Код_СправочникаПерсональныеДанные КАК ПерсональныеДанные,
	               |	ДанныеОГражданине.Код_СправочникаСоциальныеДанные КАК СоциальныеДанные,
	               |	ДанныеОГражданине.Код_СправочникаДанныеСемьи КАК ДанныеСемьи,
	               |	ДанныеОГражданине.Код_СправочнниаДанныеОСтране КАК ДанныеОСтране,
	               |	ДанныеОГражданине.Код_СправочникаНациональности КАК Национальности,
	               |	ДанныеОГражданине.Код_СправочникаВопросы КАК Вопросы
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
