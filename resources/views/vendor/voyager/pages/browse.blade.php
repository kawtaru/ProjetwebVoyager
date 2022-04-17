@extends('voyager::master')
@section('content')
    
    
    <table>
<!--   The Head of The Table -->
       <thead>
           <tr>
               
               <th>Fichiers</th>
               <th>Proprietaire</th>
               <th>Statut</th>
               <th>Modifier</th>
               <th>Type</th>
           </tr>

       </thead>

       <tbody>
           @if(Auth::user()->role_id == 1)
                @foreach($dossiers as $dossier)
                @php
                    $rest = substr($dossier->file, 1, -1);
                    $rest1 = json_decode($rest, true)
                @endphp
                @if($dossier->status == "refus" || $dossier->status == "acceptee")
                <tr>
                    
                    <td>            <a href="http://localhost:8000/storage/{{$rest1["download_link"]}}" download="">{{$dossier->name_dossier}}.zip</a></td>
                    <td><a href="http://127.0.0.1:8000/admin/users/{{$dossier->id_user}}" target="_blank">{{$dossier->name}}</a></td>
                    <td>{{$dossier->status}}</td>
                    <td>            
                    <a href="http://127.0.0.1:8000/admin/dossiers/{{$dossier->main_id}}/edit"><button>Modifier</button></a><a href="{{ URL('/delete/'.$dossier->main_id )}}"><button>Supprimer</button></a></td>
                    <td>{{$dossier->type_dossier}}</td>
                    </td>
                    </tr>
                @else
                    
                    <tr>
                    
                    <td>            <a href="http://localhost:8000/storage/{{$rest1["download_link"]}}" download="">{{$dossier->name_dossier}}.zip</a></td>
                    <td><a href="http://127.0.0.1:8000/admin/users/{{$dossier->id_user}}">{{$dossier->name}}</a></td>
                    <td>{{$dossier->id_user}}</td>
                    <td><a href="{{ URL('/deny/'.$dossier->main_id )}}"><button>❌</button></a>            <a href="{{ URL('/accept/'.$dossier->main_id )}}"><button>✅</button></a>
                    <a href="http://127.0.0.1:8000/admin/dossiers/{{$dossier->main_id}}/edit"><button>Modifier</button></a><a href="{{ URL('/delete/'.$dossier->main_id )}}"><button>Supprimer</button></a></td>
                    <td>{{$dossier->type_dossier}}</td>
                    </tr>
                @endif
                @endforeach
           
           @else
           
            @foreach($dossiers as $dossier)
                @php
                    $rest = substr($dossier->file, 1, -1);
                    $rest1 = json_decode($rest, true)
                @endphp
                @if(Auth::user()->id == $dossier->id_user)
                @if($dossier->status == "refus" || $dossier->status == "acceptee")
                <tr>
                    
                    <td>            <a href="http://localhost:8000/storage/{{$rest1["download_link"]}}" download="">{{$dossier->name_dossier}}</a></td>
                    <td><a href="http://127.0.0.1:8000/admin/users/{{$dossier->id_user}}" target="_blank">{{$dossier->name}}</a></td>
                    <td>{{$dossier->status}}</td>
                    <td>            
                    <a href="http://127.0.0.1:8000/admin/dossiers/{{$dossier->main_id}}/edit"><button>Modifier</button></a></td>
                    <td>{{$dossier->type_dossier}}</td>
                    </tr>
                @else
                    
                    <tr>
                    
                    <td>            <a href="http://localhost:8000/storage/{{$rest1["download_link"]}}" download="">{{$dossier->name_dossier}}</a></td>
                    <td><a href="http://127.0.0.1:8000/admin/users/{{$dossier->id_user}}">{{$dossier->name}}</a></td>
                    <td>{{$dossier->status}}</td>
                    <td><a href="http://127.0.0.1:8000/admin/dossiers/{{$dossier->main_id}}/edit"><button>Modifier</button></a></td>
                    <td>{{$dossier->type_dossier}}</td>
                    </tr>
                @endif
                @endif
                
                @endforeach
           
           @endif
       
       </tbody>

   </table>
@stop

<style>

boutton{
  color:#BF8B67;
}
table {border-collapse: collapse; font-family: helvetica
  width:90%; 
    margin-left:15%; 
    margin-right:15%;}
td, th {border:  1px solid;
      padding: 10px;
      min-width: 200px;
      background: white;
      box-sizing: border-box;
      text-align: center;
}
.table-container {
  position: center;
  max-height:  300px;
  width: 500px;
  overflow: scroll;
}
thead th {
  position: -webkit-sticky;
  position: sticky;
  top: 0;
  z-index: 2;
  background: #B4CFB0;
}

thead th:first-child {
  left: 0;
  z-index: 3;
}

tfoot {
  position: -webkit-sticky;
  bottom: 0;
  z-index: 2;
}

tfoot td {
  position: sticky;
  bottom: 0;
  z-index: 2;
  background: #B4CFB0;
}

tfoot td:first-child {
  z-index: 3;
}

tbody {
  overflow: scroll;
}

tr{
  height:50px;
  text-align: center;
}

tr, th{
  text-align: center;
}


tr > :first-child {
  position: -webkit-sticky;
  position: sticky; 
  background: #E5E3C9;
  left: 0; }

a{
  font-size: 1.2em;
  text-decoration: none;
  color: white;
  font-weight:bold;
}

</style>