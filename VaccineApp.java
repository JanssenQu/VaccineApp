
import java.sql.* ;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.Date;

class VaccineApp
{
    public static void main ( String [ ] args ) throws SQLException
    {
      // Unique table names.  Either the user supplies a unique identifier as a command line argument, or the program makes one up.
        String tableName = "";
        int sqlCode=0;      // Variable to hold SQLCODE
        String sqlState="00000";  // Variable to hold SQLSTATE

        if ( args.length > 0 )
            tableName += args [ 0 ] ;
        else
          tableName += "exampletbl";

        // Register the driver.  You must register the driver before you can use it.
        try { DriverManager.registerDriver ( new com.ibm.db2.jcc.DB2Driver() ) ; }
        catch (Exception cnfe){ System.out.println("Class not found"); }

        // This is the url you must use for DB2.
        //Note: This url may not valid now !
        String url = "jdbc:db2://winter2021-comp421.cs.mcgill.ca:50000/cs421";

        //REMEMBER to remove your user id and password before submitting your code!!
        String your_userid = null;
        String your_password = null;
        //AS AN ALTERNATIVE, you can just set your password in the shell environment in the Unix (as shown below) and read it from there.
        //$  export SOCSPASSWD=yoursocspasswd 
        if(your_userid == null && (your_userid = System.getenv("SOCSUSER")) == null)
        {
          System.err.println("Error!! do not have a password to connect to the database!");
          System.exit(1);
        }
        if(your_password == null && (your_password = System.getenv("SOCSPASSWD")) == null)
        {
          System.err.println("Error!! do not have a password to connect to the database!");
          System.exit(1);
        }
        Connection con = DriverManager.getConnection (url,your_userid,your_password) ;
        Statement statement = con.createStatement ( ) ;

        int choice;
        do {
            Scanner input = new Scanner(System.in);
            System.out.println("----------VaccineApp Main Menu----------");
            System.out.println("        1. Add a Person ");
            System.out.println("        2. Assign a slot to a Person ");
            System.out.println("        3. Enter Vaccination information ");
            System.out.println("        4. Exit Application ");
            System.out.println("Please Enter Your Option:");
            choice = Integer.parseInt(input.nextLine());

            switch (choice) {

                case 1:
                    ArrayList<String> dataList = new ArrayList<>();
                    String[] commands = {"Name", "Gender", "Birthdate",
                            "Group Name", "Phone Number", "Street Name", "Postal Code", "Home City"};

                    System.out.println("----------Add a Person----------");
                    System.out.println("Please Enter Person's Health Insurance Number:");
                    String currHin = input.nextLine();

                    boolean update = false;
                    ResultSet tableHin = statement.executeQuery("SELECT hin FROM person WHERE hin =" + currHin);
                    boolean hasValue = false;
                    while (tableHin.next()) {
                        if (currHin.equals(tableHin.getString("hin"))) {
                            hasValue = true;
                        }
                    }
                    if (hasValue) {
                        System.out.println("This Person Already Exist in the Database. Would you like to Update this Person's info? [y/n]");
                        String decision = input.nextLine();
                        if (decision.equals("y")) {
                            update = true;
                        }
                    }
                    else {
                        update = true;
                    }

                    if (update && !hasValue) {
                        for (int i = 0; i < commands.length; i++) {
                            System.out.println("Please Enter Person's " + commands[i] + ":");
                            String givenInput = input.nextLine();
                            if (givenInput.equals("")) {
                                dataList.add("NULL");
                            }
                            else if (i != 4) {
                                dataList.add("'" + givenInput + "'");
                            }
                            else {
                                dataList.add(givenInput);
                            }
                        }
                        statement.executeUpdate("INSERT INTO person VALUES (" + currHin + "," + dataList.get(0)
                                + "," + dataList.get(1) + "," + dataList.get(2) + ",'" + java.time.LocalDate.now()
                                + "'," + dataList.get(3) + "," + dataList.get(4) + "," + dataList.get(5) + ","
                                + dataList.get(6) + "," + dataList.get(7) + ")");
                    }

                    if (update && hasValue) {
                        String[] keys = {"pname", "gender", "birthdate", "gname", "phone", "pstreet", "ppostal", "pcity"};
                        int choiceNum;
                        do {
                            System.out.println("Please Enter Your Option:");
                            for (int i = 0; i < commands.length; i++) {
                                int c = i+1;
                                System.out.println("        "+ c + ". " + commands[i]);
                            }
                            System.out.println("        9. Exit Update");
                            choiceNum = Integer.parseInt(input.nextLine());

                            if (choiceNum != 9) {
                                ArrayList<String> list = new ArrayList<>();
                                System.out.println("Please Enter the new info:");
                                String change = input.nextLine();
                                if (change.equals("")) {
                                    list.add("NULL");
                                }
                                else if (choiceNum != 5) {
                                    list.add("'" + change + "'");
                                }
                                else {
                                    list.add(change);
                                }
                                statement.executeUpdate("UPDATE person SET " + keys[choiceNum-1] + "=" + list.get(0) + " WHERE hin=" + currHin);
                            }

                        } while (choiceNum != 9);
                    }
                    break;

                case 2:
                    System.out.println("----------Assign a slot to a Person----------");
                    System.out.println("Please Enter Person's Health Insurance Number:");
                    String hin = input.nextLine();
                    ResultSet doseTable = statement.executeQuery("SELECT numofdoses " +
                            "FROM personalloc JOIN slot " +
                            "ON personalloc.slotid = slot.slotid " +
                            "JOIN vaccslot " +
                            "ON slot.slotid = vaccslot.slotid " +
                            "JOIN vaccine " +
                            "ON vaccslot.manufacturer = vaccine.manufacturer " +
                            "WHERE hin =" + hin);
                    int DosesReq = -1;
                    int DosedGotten = 0;
                    while (doseTable.next()) {
                        DosesReq = doseTable.getInt("numofdoses");
                        DosedGotten++;
                    }
                    if (DosesReq != DosedGotten) {
                        System.out.println("----------Available slots----------");
                        ResultSet slotTable = statement.executeQuery("SELECT slot.slotid, slot.vacctime, slot.vaccdate, slot.lname " +
                                "FROM slot " +
                                "EXCEPT " +
                                "SELECT slot.slotid, slot.vacctime, slot.vaccdate, slot.lname " +
                                "FROM slot JOIN personalloc " +
                                "ON slot.slotid = personalloc.slotid " +
                                "ORDER BY slotid");

                        ArrayList<String> slots = new ArrayList<>();
                        System.out.println("SlotID      Vaccination Time        Vaccination Date        Location Name");
                        boolean isEmpty = true;
                        while (slotTable.next()) {
                            isEmpty = false;
                            String slot = slotTable.getString("slotid");
                            slots.add(slot);
                            System.out.println(slot + "          " + slotTable.getString("vacctime")
                            + "               " + slotTable.getString("vaccdate") + "          " + slotTable.getString("lname"));
                        }
                        if (isEmpty) {
                            System.out.println("There are no slots available.");
                            continue;
                        }

                        System.out.println("Please Enter the slot ID that you want to assign:");
                        String slotid = input.nextLine();
                        if (slots.contains(slotid)) {
                            statement.executeUpdate("INSERT INTO personalloc VALUES (" + slotid + "," + hin + ",'"
                            + java.time.LocalDate.now() + "')");
                        }
                        else {
                            System.out.println("This slot has already been assigned or does not exist.");
                        }

                    }
                    else {
                        System.out.println("This Person already received the number of doses required.");
                    }
                    break;

                case 3:
                    System.out.println("----------Enter Vaccination information----------");
                    String[] outputs = {"slot ID", "name of the vaccine manufacturer", "batch number", "vial number", "assigned nurse's license number"};
                    ArrayList<String> inputs = new ArrayList<>();
                    boolean sameVacc = true;
                    String brand = null;
                    for (int i = 0; i < outputs.length; i++) {
                        System.out.println("Please Enter the " + outputs[i] + ": ");
                        inputs.add(input.nextLine());
                        if (i == 1) {
                            ResultSet vaccineTable = statement.executeQuery("SELECT DISTINCT manufacturer" +
                                    " FROM personalloc JOIN vaccslot" +
                                    " ON personalloc.slotid = vaccslot.slotid" +
                                    " WHERE hin = (SELECT hin" +
                                    " FROM personalloc" +
                                    " WHERE slotid =" + inputs.get(0) + ")");
                            while (vaccineTable.next()) {
                                brand = vaccineTable.getString("manufacturer");
                                if (!brand.equals(inputs.get(1))) {
                                    sameVacc = false;
                                }
                            }
                            if (!sameVacc) {
                                break;
                            }
                        }
                    }

                    if (sameVacc) {
                        statement.executeUpdate("INSERT INTO vaccslot VALUES (" + inputs.get(0) + ",'" + inputs.get(1)
                        + "'," + inputs.get(2) + "," + inputs.get(3) + ")");
                        statement.executeUpdate("INSERT INTO assignednurse VALUES (" + inputs.get(0) + "," + inputs.get(4)
                        + ")");
                    }
                    else {
                        System.out.println("Person must be vaccinated with " + brand + " vaccine.");
                    }

                case 4:
                    break;
            }
        } while (choice != 4);
      // Finally but importantly close the statement and connection
      statement.close ( ) ;
      con.close ( ) ;
    }
}
