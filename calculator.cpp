#include "calculator.h"
#include <QDebug>
#include "iostream"
#include <string>
#include <string.h>
#include <algorithm>
#include <stdio.h>
calculator::calculator(QObject *parent)
    : QObject{parent}
{

}
calculator::values calculator::read_display_value(QString display_value) {
    std::string str = display_value.toStdString();
    char str_Inchar[str.length()] ;
        strcpy(str_Inchar, str.c_str());                                           //In this way we can look for all type of operators
    char operators[] = "+-/*";
    //auto first_valueIndex = std::find(str.begin(), str.end(), operators[0]);     //Tambien se podria usar  strcspn
    //int index1 = std::distance(str.begin(), first_valueIndex);
    int index1= strcspn (str_Inchar,operators);
    char value1[index1];
    for(int i=0; i<index1; i++) {
        value1[i] = str[i];
    }
    int size_arr = sizeof(value1) / sizeof(char);
    std::string string = "";
    for (int i = 0; i < size_arr; i++) {
        string = string + value1[i];
    }
    int value1_toInt = std::stoi(string);
    auto second_valueIndex = std::find(str.begin(), str.end(), '\0');
    int index2 = std::distance(str.begin(), second_valueIndex);
    char value2[index2-index1];
    for(int i=index1;i<index2;i++) {
        value2[i-index1] = str[i+1];
    }
    int size_arr2 = sizeof(value2) / sizeof(char);
    std::string string2 = "";
    for (int i = 0; i < size_arr2; i++) {
        string2 = string2 + value2[i];
    }
    int value2_toInt = std::stoi(string2);
    //qDebug() << value2_toInt ;
    values val;                         //structure created in the header
    val.value1 = value1_toInt;
    val.value2 = value2_toInt;
    return val;
}
QString calculator::addOperation(QString display_value)
{
    values val;
    val.value1 = read_display_value(display_value).value1;
    val.value2 = read_display_value(display_value).value2;
    int result = val.value1 + val.value2;
    QString str = QString::number(result);
    qDebug() << str;
    return str; 

}
