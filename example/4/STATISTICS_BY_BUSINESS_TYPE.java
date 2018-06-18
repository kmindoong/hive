// ORM class for table 'STATISTICS_BY_BUSINESS_TYPE'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Mon Jun 18 09:24:13 UTC 2018
// For connector: org.apache.sqoop.manager.MySQLManager
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.mapred.lib.db.DBWritable;
import com.cloudera.sqoop.lib.JdbcWritableBridge;
import com.cloudera.sqoop.lib.DelimiterSet;
import com.cloudera.sqoop.lib.FieldFormatter;
import com.cloudera.sqoop.lib.RecordParser;
import com.cloudera.sqoop.lib.BooleanParser;
import com.cloudera.sqoop.lib.BlobRef;
import com.cloudera.sqoop.lib.ClobRef;
import com.cloudera.sqoop.lib.LargeObjectLoader;
import com.cloudera.sqoop.lib.SqoopRecord;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

public class STATISTICS_BY_BUSINESS_TYPE extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  public static interface FieldSetterCommand {    void setField(Object value);  }  protected ResultSet __cur_result_set;
  private Map<String, FieldSetterCommand> setters = new HashMap<String, FieldSetterCommand>();
  private void init0() {
    setters.put("BUSINESS_TYPE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        BUSINESS_TYPE = (String)value;
      }
    });
    setters.put("TOTAL_AMOUNT", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        TOTAL_AMOUNT = (Integer)value;
      }
    });
  }
  public STATISTICS_BY_BUSINESS_TYPE() {
    init0();
  }
  private String BUSINESS_TYPE;
  public String get_BUSINESS_TYPE() {
    return BUSINESS_TYPE;
  }
  public void set_BUSINESS_TYPE(String BUSINESS_TYPE) {
    this.BUSINESS_TYPE = BUSINESS_TYPE;
  }
  public STATISTICS_BY_BUSINESS_TYPE with_BUSINESS_TYPE(String BUSINESS_TYPE) {
    this.BUSINESS_TYPE = BUSINESS_TYPE;
    return this;
  }
  private Integer TOTAL_AMOUNT;
  public Integer get_TOTAL_AMOUNT() {
    return TOTAL_AMOUNT;
  }
  public void set_TOTAL_AMOUNT(Integer TOTAL_AMOUNT) {
    this.TOTAL_AMOUNT = TOTAL_AMOUNT;
  }
  public STATISTICS_BY_BUSINESS_TYPE with_TOTAL_AMOUNT(Integer TOTAL_AMOUNT) {
    this.TOTAL_AMOUNT = TOTAL_AMOUNT;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof STATISTICS_BY_BUSINESS_TYPE)) {
      return false;
    }
    STATISTICS_BY_BUSINESS_TYPE that = (STATISTICS_BY_BUSINESS_TYPE) o;
    boolean equal = true;
    equal = equal && (this.BUSINESS_TYPE == null ? that.BUSINESS_TYPE == null : this.BUSINESS_TYPE.equals(that.BUSINESS_TYPE));
    equal = equal && (this.TOTAL_AMOUNT == null ? that.TOTAL_AMOUNT == null : this.TOTAL_AMOUNT.equals(that.TOTAL_AMOUNT));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof STATISTICS_BY_BUSINESS_TYPE)) {
      return false;
    }
    STATISTICS_BY_BUSINESS_TYPE that = (STATISTICS_BY_BUSINESS_TYPE) o;
    boolean equal = true;
    equal = equal && (this.BUSINESS_TYPE == null ? that.BUSINESS_TYPE == null : this.BUSINESS_TYPE.equals(that.BUSINESS_TYPE));
    equal = equal && (this.TOTAL_AMOUNT == null ? that.TOTAL_AMOUNT == null : this.TOTAL_AMOUNT.equals(that.TOTAL_AMOUNT));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.BUSINESS_TYPE = JdbcWritableBridge.readString(1, __dbResults);
    this.TOTAL_AMOUNT = JdbcWritableBridge.readInteger(2, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.BUSINESS_TYPE = JdbcWritableBridge.readString(1, __dbResults);
    this.TOTAL_AMOUNT = JdbcWritableBridge.readInteger(2, __dbResults);
  }
  public void loadLargeObjects(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void loadLargeObjects0(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void write(PreparedStatement __dbStmt) throws SQLException {
    write(__dbStmt, 0);
  }

  public int write(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(BUSINESS_TYPE, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(TOTAL_AMOUNT, 2 + __off, 4, __dbStmt);
    return 2;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(BUSINESS_TYPE, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(TOTAL_AMOUNT, 2 + __off, 4, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.BUSINESS_TYPE = null;
    } else {
    this.BUSINESS_TYPE = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.TOTAL_AMOUNT = null;
    } else {
    this.TOTAL_AMOUNT = Integer.valueOf(__dataIn.readInt());
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.BUSINESS_TYPE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BUSINESS_TYPE);
    }
    if (null == this.TOTAL_AMOUNT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.TOTAL_AMOUNT);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.BUSINESS_TYPE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BUSINESS_TYPE);
    }
    if (null == this.TOTAL_AMOUNT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.TOTAL_AMOUNT);
    }
  }
  private static final DelimiterSet __outputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  public String toString() {
    return toString(__outputDelimiters, true);
  }
  public String toString(DelimiterSet delimiters) {
    return toString(delimiters, true);
  }
  public String toString(boolean useRecordDelim) {
    return toString(__outputDelimiters, useRecordDelim);
  }
  public String toString(DelimiterSet delimiters, boolean useRecordDelim) {
    StringBuilder __sb = new StringBuilder();
    char fieldDelim = delimiters.getFieldsTerminatedBy();
    __sb.append(FieldFormatter.escapeAndEnclose(BUSINESS_TYPE==null?"null":BUSINESS_TYPE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(TOTAL_AMOUNT==null?"null":"" + TOTAL_AMOUNT, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(BUSINESS_TYPE==null?"null":BUSINESS_TYPE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(TOTAL_AMOUNT==null?"null":"" + TOTAL_AMOUNT, delimiters));
  }
  private static final DelimiterSet __inputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  private RecordParser __parser;
  public void parse(Text __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharSequence __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(byte [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(char [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(ByteBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  private void __loadFromFields(List<String> fields) {
    Iterator<String> __it = fields.listIterator();
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BUSINESS_TYPE = null; } else {
      this.BUSINESS_TYPE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.TOTAL_AMOUNT = null; } else {
      this.TOTAL_AMOUNT = Integer.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BUSINESS_TYPE = null; } else {
      this.BUSINESS_TYPE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.TOTAL_AMOUNT = null; } else {
      this.TOTAL_AMOUNT = Integer.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    STATISTICS_BY_BUSINESS_TYPE o = (STATISTICS_BY_BUSINESS_TYPE) super.clone();
    return o;
  }

  public void clone0(STATISTICS_BY_BUSINESS_TYPE o) throws CloneNotSupportedException {
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("BUSINESS_TYPE", this.BUSINESS_TYPE);
    __sqoop$field_map.put("TOTAL_AMOUNT", this.TOTAL_AMOUNT);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("BUSINESS_TYPE", this.BUSINESS_TYPE);
    __sqoop$field_map.put("TOTAL_AMOUNT", this.TOTAL_AMOUNT);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if (!setters.containsKey(__fieldName)) {
      throw new RuntimeException("No such field:"+__fieldName);
    }
    setters.get(__fieldName).setField(__fieldVal);
  }

}
