﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
namespace ClinicaFrba.Compra_Bono
{
    public partial class Principal : Form
    {
        Abm_Afiliado.Afiliado afiliadoBuscado;
        int idPlan;
        int precioBono;
        Server server = Server.getInstance();

        public Principal()
        {
            InitializeComponent();

        }

        private void numericUpDown1_ValueChanged(object sender, EventArgs e)
        {
            etiquetaMonto.Text = (cantidad.Value * precioBono).ToString();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Abm_Afiliado.BuscarAfiliados busqueda = new Abm_Afiliado.BuscarAfiliados();
            busqueda.ShowDialog();
            afiliadoBuscado = busqueda.afiliadoBuscado;
            etiquetaPaciente.Text = afiliadoBuscado.id.ToString();
            SqlDataReader reader = server.query("SELECT * FROM GESTIONAME_LAS_VACACIONES.obtenerPlanAcutalAfiliado(" + afiliadoBuscado.id.ToString() + ")");
            reader.Read();
            EtiquetaPlan.Text = reader["descripcion"].ToString();
            precioBono = Convert.ToInt16(reader["precioBono"]);
            reader.Close();
        }

        private void botonAceptar_Click(object sender, EventArgs e)
        {
            SqlDataReader read = server.query("EXEC GESTIONAME_LAS_VACACIONES.compraDeBonos '" + afiliadoBuscado.id.ToString() + "', '" + cantidad.Value.ToString()+"'");
            read.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (etiquetaPaciente.Text == "")
            {
                MessageBox.Show("Todavia no ingreso ningun paciente");
            }
            else {
                SqlDataReader reader = server.query("Select sum(b.cantidad) from GESTIONAME_LAS_VACACIONES.ComprasBonos b where b.idPaciente =" + etiquetaPaciente.Text);
                reader.Read();
                MessageBox.Show("El usuario ahora poseee: "+reader.GetInt32(0).ToString()
                    +" bonos");
                reader.Close();
            }
        }
    }
}
