import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Tabs/SalesTab.dart';

void main() => runApp(new SaleEntry());

class SaleEntry extends StatelessWidget {
  final String animalcode,animalstatus,sellingdate,buyername,adress,totalprice; 
 
 const SaleEntry(
 {
    this.animalcode, this.animalstatus, this.sellingdate, this.adress, this.buyername, this.totalprice
  }
);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Form Demo',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new _SaleEntry(title: 'Sale Entry Details',),
    );
  }
}

class _SaleEntry extends StatefulWidget {
  _SaleEntry({Key key, this.title}) : super(key: key);
  final String title;

  @override
  SalePageState createState() => new SalePageState();
}

class SalePageState extends State<_SaleEntry> {

  var _animalcodeController = new TextEditingController();
  var _animalstatusController = new TextEditingController();
  var _sellingdateController = new TextEditingController();
  var _buyernameController = new TextEditingController();
  var _buyerAdressController = new TextEditingController();
  var _contactsController = new TextEditingController();
  var _totalpriceController = new TextEditingController();
  
 
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  
  List<String> _colors = <String>['', 'Dead on Farm', 'Born On Farm', 'Purchased', 'Sold'];
  String _color = '';

  DateTime _date = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();

Future<Null> _selectedDate(BuildContext context) async {
  final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: new DateTime(2016),
      lastDate: new DateTime(2019));

  if (picked != null && picked != _date) {
    print("Date selected ${_date.toString()}");
    setState(() {
      _date = picked;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        centerTitle: true,
      
        backgroundColor: Colors.amber,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.push(
        context, MaterialPageRoute(builder: (context) => SalesTab())),
        
      ),
      ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                
                padding: const EdgeInsets.all(20.0),
                
                children: <Widget>[
                   new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Animal Code',
                        ),
                        isEmpty: _color == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton(
                            value: _color,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                var newContact;
                                newContact.favoriteColor = newValue;
                                _color = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _colors.map((String value) {
                              return new DropdownMenuItem(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                  new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Animal Status',
                        ),
                        isEmpty: _color == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton(
                            value: _color,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                var newContact;
                                newContact.favoriteColor = newValue;
                                _color = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _colors.map((String value) {
                              return new DropdownMenuItem(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                  
                  new GestureDetector(
                    onTap: () => _selectedDate(context),
                    child: AbsorbPointer(
                      child:
                  new TextField(
                    controller: _sellingdateController,
                     onChanged: (value) => _sellingdateController.text = value,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.calendar_today,color: Colors.green,),
                      hintText:   'Selling Date',
                      labelText:  'Selling Date',
                    ),
                    keyboardType: TextInputType.numberWithOptions(),
                   ) )),
                 
                  
                  new TextField(
                  controller: _buyernameController,
                     onChanged: (value) => _buyernameController.text = value,
                    decoration: const InputDecoration(                     
                       hintText: 'Buyer Name',
                      
                    ),
                  ),
                    new TextField(
                      controller: _buyerAdressController,
                      onChanged: (value) => _buyerAdressController.text = value,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                       hintText: 'Buyer Adress',
                       ),
                  ),
                   
                   new TextField(
                     controller: _contactsController,
                     onChanged: (value) => _contactsController.text = value,
                keyboardType: TextInputType.phone ,
                autofocus: false,
                // initialValue: '+91-',
                decoration: InputDecoration(
                suffixIcon: Icon(Icons.phone_iphone,color: Colors.green,),
                hintText: 'Mobile Number',
                  contentPadding: EdgeInsets.fromLTRB(5.0, 20.0, 20.0, 20.0),
                      )
                      ),


                      new TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Price',
                      // labelText: 'Symbol',
                    ),
                  ),
                  
                  new TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Discount',
                      // labelText: 'Symbol',
                    ),
                  ),
                Divider(),
                
                new TextField(
                      controller: _totalpriceController,
                      onChanged: (value) => _totalpriceController.text = value,
                keyboardType: TextInputType.phone ,
                autofocus: false,
                // initialValue: 'Total Rs:',
                decoration: InputDecoration(filled: true,
                  contentPadding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 15.0),
                   border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0,),
                   )),
                  ),
                    
                    new Container(
                    child: new Padding(
                    padding: EdgeInsets.symmetric(vertical: 75.0),
                    child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    shadowColor: Colors.lightBlueAccent.shade100,
                    elevation: 6.0,
                    child: MaterialButton(
                    minWidth: 200.0,
                    height: 47.0,
                    onPressed: ()=> Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SalesTab())),
                    color: Colors.amber,
                    child: Text('Add',style:TextStyle(color:Colors.white,fontSize: 20.0)),

                   ) ,
                   ),
                     ),
                      ),
                    ],
                      ))),
                );
              }
              }
    
    class SaleEntrydetail extends StatefulWidget{

    final String value;
    
    SaleEntrydetail({Key key,this.value}): super(key:key);
    
      @override
        
      _SaledetailPageState createState() => _SaledetailPageState();
         
          }
  
  class _SaledetailPageState extends State<SaleEntrydetail> {
    
    bool isPriority = false;
    
    void _toggleFlag(){
    setState(() {
     if(isPriority) {
       isPriority = false;
     }else{
       isPriority = true;
     }
    });

  }

  @override
  Widget build(BuildContext context) {
    
    return new  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        
        accentColor: Colors.amber,
        brightness: Brightness.light,
      ),
      
      home:Scaffold(
        floatingActionButton: new FloatingActionButton(
            elevation: 20.0,
            highlightElevation: 20.0,
            isExtended: true,
            child: new Icon(Icons.add, color: Colors.white),
            onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => SaleEntry())),
          ), 
     
     body:ListView.builder( itemCount: 20,
         
        shrinkWrap: true,
        itemBuilder: (BuildContext context,int index) => Container(
        //width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 10.0),
       
          child: Card(
        
          margin: EdgeInsets.only(left: 10.0,right: 10.0),
          elevation: 10.0,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.5)
         ),
          color: Colors.white70,
          
          child: Container(decoration: BoxDecoration(
            color: Colors.transparent,
            
          ),
          
       
        //width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 30.0),
        padding: EdgeInsets.only(right: 80.0),

        
        child: 
       
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Container(
                //   width: 80.0,
                //   height: 80.0,
                //   color: Colors.white70,
                //   child: CircleAvatar(
                //     // backgroundColor: Colors.green,
                    
                //     backgroundImage: NetworkImage
                //     ("https://www.google.com/search?q=chicken+images&rlz=1C1CHBF_enIN815IN815&tbm=isch&source=iu&ictx=1&fir=pQab4VRy_gKVlM%253A%252Cn02ibD9yVjdVZM%252C_&usg=AI4_-kTMhWDVRKAs8u3ox2RVQjz7MFiaWQ&sa=X&ved=2ahUKEwies97Du7jgAhUHf30KHR75CFoQ9QEwCnoECAAQGA#imgrc=pQab4VRy_gKVlM:"),
                    
                //     ),
                  
                //     ),
                SizedBox(width: 20.0,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    
                    new Text("Animal Code: ${widget.value}"),
                    Divider(),
                    new Text("Animal Status: ${widget.value}"),
                    Divider(),
                    new Text("Selling Date: ${widget.value}"),
                    Divider(),
                    new Text("Buyer Name: ${widget.value}"),
                    Divider(),
                    new Text("Buyer Adress: ${widget.value}"),
                    Divider(),
                    new Text("Total Price: ${widget.value}"),
  
                    Divider(color: Colors.teal,indent: 50.0,),
                    // new IconButton(
                    // icon: Icon(Icons.delete),
                    // iconSize: 45.0,
                    // color:(isPriority)? Colors.red : Colors.green,
                    // onPressed: _toggleFlag,
                    //  ),

                    ],
                 
                ),
              
          ],
        ),
        
          ),
         
    ),
   
     ),
      )
      ),
      );
    }
  }