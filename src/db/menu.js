module.exports = {
    admin : () => {
        return menuAdmin;
    },
    gth : () => {
        return menuGth;
    },
    finanzas : () => {
        return menuFinanzas;
    },
    jefeDepartamento : () => {
        return menuJefeDepartamento;
    },
    estudiante : () => {
        return estudiante;
    }
}
const menuAdmin = {
    "menu": [{
        "state": "home",
        "name": "Home",
        "type": "link",
        "icon": "dashboard",
      },
        {
        "state": "historialDepartamento",
        "name": "Departamento",
        "type": "link",
        "icon": "domain"
      },
      {
        "state": "areasDepartamento",
        "name": "Areas del departamento",
        "type": "link",
        "icon": "store_mall_directory"
      },
      {
        "state": "registroAsistencia",
        "name": "Registro de asistencia",
        "type": "sub",
        "icon": "speaker_group",
        "children": [{
            "state": "registroAsistencia",
            "name": "Hoy",
            "type": "link"
          },
          {
            "state": "registroAsistencia",
            "name": "Ayer",
            "type": "link"
          }
        ]
      },
      {
        "state": "informesJefeDepartamento",
        "name": "Informes",
        "type": "sub",
        "icon": "attach_file",
        "children": [{
            "state": "informesAprobadosJD",
            "name": "Informes aprobados",
            "type": "link"
          },
          {
            "state": "informesArchivadosJD",
            "name": "Informes Archivados",
            "type": "link"
          },
          {
            "state": "informesEliminadosJD",
            "name": "Informes Archivados",
            "type": "link"
          }
        ]
      }
    ]
}

const menuGth = {
    
    "menu": [{
        "state": "home",
        "name": "Home",
        "type": "link",
        "icon": "dashboard",
        },
        {
        "state": "departamento",
        "name": "Departamento",
        "type": "link",
        "icon": "domain"
      }
    ]
}

const menuFinanzas = {
    "menu": [
        {
            "state": "home",
            "name": "Home",
            "type": "link",
            "icon": "dashboard",
            },
        {
        "state": "usuario",
        "name": "Usuario",
        "type": "link",
        "icon": "group"
      },
      {
        "state": "convenio",
        "name": "Convenio",
        "type": "link",
        "icon": "insert_drive_file"
      },
      {
        "state": "informeFinanzas",
        "name": "Informes",
        "type": "sub",
        "icon": "attach_file",
        "children": [{
            "state": "informesBandejaF",
            "name": "Bandeja",
            "type": "link"
          },
          {
            "state": "informesRevisadosF",
            "name": "Revisados",
            "type": "link"
          }
        ]
      },
      {
        "state": "beca",
        "name": "Beca",
        "type": "sub",
        "icon": "brightness_high",
        "children": [{
            "state": "informeAcreditaciones",
            "name": "Acreditaciones",
            "type": "link"
          },
          {
            "state": "informeDescuentos",
            "name": "Descuentos",
            "type": "link"
          }
        ]
      }
    ]
}

const menuJefeDepartamento = {
    "menu": [
        {
            "state": "home",
            "name": "Home",
            "type": "link",
            "icon": "dashboard",
            },
            {
        "state": "historialDepartamento",
        "name": "Departamento",
        "type": "link",
        "icon": "domain"
      },
      {
        "state": "areasDepartamento",
        "name": "Areas del departamento",
        "type": "link",
        "icon": "store_mall_directory"
      },
      {
        "state": "registroAsistencia",
        "name": "Registro de asistencia",
        "type": "sub",
        "icon": "speaker_group",
        "children": [{
            "state": "registroAsistencia",
            "name": "Hoy",
            "type": "link"
          },
          {
            "state": "registroAsistencia",
            "name": "Ayer",
            "type": "link"
          }
        ]
      },
      {
        "state": "informesJefeDepartamento",
        "name": "Informes",
        "type": "sub",
        "icon": "attach_file",
        "children": [{
            "state": "informesAprobadosJD",
            "name": "Informes aprobados",
            "type": "link"
          },
          {
            "state": "informesArchivadosJD",
            "name": "Informes Archivados",
            "type": "link"
          },
          {
            "state": "informesEliminadosJD",
            "name": "Informes Archivados",
            "type": "link"
          }
        ]
      }
    ]
}

const estudiante = {
    "menu": [
        {
            "state": "home",
            "name": "Home",
            "type": "link",
            "icon": "dashboard",
            },
        {
        "state": "historialDepartamento",
        "name": "Departamento",
        "type": "link",
        "icon": "domain"
      },
      {
        "state": "historialSaldoEstudiante",
        "name": "Historial de saldos",
        "type": "link",
        "icon": "money"
      }
    ]
}

