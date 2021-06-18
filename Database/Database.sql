

public class DBHelper extends SQLiteOpenHelper {
    private static final String dname="dbevent";

    public DBHelper(@Nullable Context context)
    {
        super(context, dname, null, 4);
    }

    @Override
    public void onCreate(SQLiteDatabase sqLiteDatabase)
    {
        String qry="create table tbl_event (id integer primary key autoincrement, name text, roll text, dep text, sec text, hall text)";
        sqLiteDatabase.execSQL(qry);
    }

    @Override
    public void onUpgrade(SQLiteDatabase sqLiteDatabase, int i, int i1)
    {
        String qry="DROP TABLE IF EXISTS tbl_event";
        sqLiteDatabase.execSQL(qry);
        onCreate(sqLiteDatabase);
    }

    public  String addrecord(String name, String roll,String dep, String sec,String hall)
    {
        SQLiteDatabase db=this.getWritableDatabase();

        ContentValues cv=new ContentValues();
        cv.put("name",name);
        cv.put("father",roll);
        cv.put("contact",dep);
        cv.put("email",sec);
        cv.put("age",hall);
        float res=db.insert("tbl_contact",null,cv);

        if(res==-1)
            return "Failed";
        else
            return  "Successfully inserted";

    }

    public Cursor readalldata()
    {
        SQLiteDatabase db=this.getWritableDatabase();
        String qry="select * from tbl_event order by id desc";
        Cursor cursor=db.rawQuery(qry,null);
        return  cursor;
    }
}


