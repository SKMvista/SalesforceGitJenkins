public class StringArrayTest {
    public static List<String> generateStringArray(Integer numberOfTest){
        List<String> lstString = new List<String>();
        for(Integer i = 0; i<numberOfTest; i++){
            lstString.add('Test '+i);
        }
        return lstString;
    }
}