import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Tabs/VaccineTab.dart';
import 'package:flutter_app/Screens/blocs/vaccine_bloc.dart';
void main() => runApp(new Vaccine());
class Vaccine extends StatelessWidget {
//   final String vaccineName, animalAge;

// const Vaccine(
//   {
//     this.vaccineName, this.animalAge
//   }
// );
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
                primaryColor: Colors.green[450],
                accentColor: Colors.green,
                primarySwatch: Colors.green,
                brightness: Brightness.light,
              ),
      home: new VaccinePage(title: 'Vaccine Schedule'),
    );
  }
}
class VaccinePage extends StatefulWidget {
  VaccinePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _VaccinePageState createState() => new _VaccinePageState();
}
class _VaccinePageState extends State<VaccinePage> {
 
  @override
  Widget build(BuildContext context) {
    final bloc = VaccineBloc();
         
            Widget animalAge(){
                    return StreamBuilder<String>(
                      stream: bloc.animalAgeStream,
                      builder:(context,snapshot){
                      return new TextField(
                        onChanged: bloc.ageAnimalsChanged,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          errorText: snapshot.error,
                          icon: Icon(Icons.assignment,color:Colors.green),
                          labelText: 'Animal Age',
                        ),
                      );}
                        );}
            Widget vaccineName(){
                  return StreamBuilder<String>(
                    stream: bloc.vaccineNameStream,
                    builder:(context,snapshot){
                    return new TextField(
                    onChanged: bloc.vaccineNameChanged,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      errorText: snapshot.error,
                      icon: Icon(Icons.local_hospital,color:Colors.green),
                      labelText: 'Vaccine Name',
                    ),
                  );}
                  );}
            Widget vaccineType(){
                  return StreamBuilder<String>(
                    stream: bloc.vaccinesTypeStream,
                    builder:(context,snapshot){
                  return new TextField(
                    onChanged: bloc.vaccineTypeChanged,
                    decoration: InputDecoration(
                      errorText: snapshot.error,
                      icon: Icon(Icons.colorize,color:Colors.green),
                      labelText: 'Vaccine Type',
                    ),
                  );}
                  );}
            Widget vaccineCompany(){
                  return StreamBuilder<String>(
                    stream: bloc.companyVaccineStream,
                    builder:(context,snapshot){
                  return new TextField(
                    onChanged: bloc.companyChanged,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.location_city,color:Colors.green),
                      labelText: 'Vaccine Company',
                    ),
                  );}
                  );}
                Widget vaccineRemarks(){
                  return StreamBuilder<String>(
                    stream: bloc.remarksStream,
                    builder:(context,snapshot){  
                    return new TextField(
                    onChanged: bloc.remarksChanged,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.mode_edit,color:Colors.green),
                      labelText: 'Remarks',
                        ),
                      keyboardType: TextInputType.multiline,
                    );}
                  );}
                Widget button(){
                  return StreamBuilder<bool>(
                  stream: bloc.submitedbutton,
                  builder:(context, snapshot){ 
                    return RaisedButton(
                      color: Colors.amber,
                      child: Text('Add',style:TextStyle(color:Colors.white,fontSize: 20.0)),
                    // minWidth: 200.0,
                    // height: 47.0,
                    onPressed: ()=> Navigator.push(
                    context, MaterialPageRoute(builder: (context) => VaccineTab())),
                      );}
                     );}

          return new Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: new AppBar(
            title: new Text(widget.title),
            centerTitle: true,
            backgroundColor: Colors.amber,
            leading: IconButton(icon: Icon(Icons.arrow_back_ios), 
            onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context)=>VaccineTab()));
            }
            ),
            actions: <Widget>[
              new IconButton(icon: Icon(Icons.rotate_right,size: 35.0,),color: Colors.white,
              onPressed: () {},
              )
            ],
        ),
        body:new SingleChildScrollView(
                      child: new Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 32.0),
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(height: 2.0),
                            animalAge(),
                            SizedBox(height: 10.0),
                            vaccineName(),
                            SizedBox(height: 10.0),
                            vaccineType(),
                            SizedBox(height: 10.0),
                            vaccineCompany(),
                            SizedBox(height:10.0),
                            vaccineRemarks(),
                            SizedBox(height: 30.0),
                            button(),
                        ],
                    ))),
                  );
                }
              }
              
class VaccineSched extends StatefulWidget{
    final String value;
    VaccineSched({Key key,this.value}): super(key:key);
      @override
        _TreatmentlistPageState createState() => _TreatmentlistPageState();
          }
class _TreatmentlistPageState extends State<VaccineSched> {
    bool isPriority = false;
    void _toggleFlag(){
    setState(() {
     if(isPriority) {
       isPriority = false;
    }else{
       isPriority = true;
     }
    }
    );
  }

  @override
  Widget build(BuildContext context) {  
    return new 
    //  MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   theme: new ThemeData(
    //     accentColor: Colors.amber,
    //     brightness: Brightness.light,
    //   ),
      
      // home:
      Scaffold(
        resizeToAvoidBottomPadding: false,
        floatingActionButton: new FloatingActionButton(
            backgroundColor: Colors.amber,
            elevation: 20.0,
            highlightElevation: 20.0,
            isExtended: true,
            child: new Icon(Icons.add, color: Colors.white),
            onPressed: () => Navigator.push(
                 context, MaterialPageRoute(builder: (context) => Vaccine())),
          ), 
     
     body:ListView.builder(itemCount: 7,
        shrinkWrap: true,
        itemBuilder: (BuildContext context,int index) =>
         Container(
        // width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Card(
                margin: EdgeInsets.only(left: 10.0,right: 10.0),
                elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.5)
                  ),
        child: 
            Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                            ListTile(
                              leading: CircleAvatar( backgroundColor: Colors.green,radius: 30.0,),
                              trailing: new IconButton(
                                icon: Icon(Icons.delete),
                                  iconSize: 25.0,
                                    color:(isPriority)? Colors.green : Colors.redAccent,
                                    onPressed: _toggleFlag,
                                      ),
                          contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 20.0, 3.0),
                          title: Text('Vaccine Schedule'),
                          subtitle: Text('Details'),
                           ),
               
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                      new Text("Vaccine Name: ${widget.value}"),
                      Divider(),
                      new Text("AnimalAge: ${widget.value}"),
                  ]),

                  ButtonTheme.bar(
                  // make buttons use the appropriate styles for cards
                    child: ButtonBar(
                      children: <Widget>[
                        // FlatButton(
                        //   child: Text('Save',style: TextStyle(color: Colors.teal),),
                        //   onPressed: () {/* ... */},
                        //   ),
                        FlatButton(
                          child: Text('Edit',style: TextStyle(color: Colors.teal),),
                          onPressed: () {/* ... */},
                        ),
                      ],
                    ),
                   ),
                  ],
                ),
                ),
            ),
        ),
      );
    }
  }
    
    