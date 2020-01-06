package com.cursmysql;




public class Main {

    public static void main(String[] args)  {

       // Students student = new Students("4MM", "Muntean", "Maria", "2910608832342","1991-06-08");
        //Students.insertStudents( student);
       // Students.showStudents();
       // Teachers.createTable();
        Students student2 = new Students("1IV","Ionescu","Ion Andrei","1234567899876","1999-12-11");
        Students.updateStudents(student2);
        DbConnector.closeConnection();
    }
}
