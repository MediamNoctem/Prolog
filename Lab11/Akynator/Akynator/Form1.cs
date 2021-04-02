using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using SbsSW.SwiPlCs;

namespace Akynator
{
    public partial class Form1 : System.Windows.Forms.Form
    {
        public string[] x = new string[9];
        static int I = 0;
        public Form1()
        {
            InitializeComponent();
            Question(I);
        }

        private void label1_Click(object sender, EventArgs e)
        {
            
        }

        public void Question(int z)
        {
            switch (z) {
                case 0:
                    label1.Text = "What is the race of this character?\n";
                    label1.Text += "1. Ainur\n";
                    label1.Text += "2. Maiar\n";
                    label1.Text += "3. Quendi\n";
                    label1.Text += "4. Atani\n";
                    label1.Text += "5. Casari\n";
                    label1.Text += "6. Dragons\n";
                    label1.Text += "7. Other race";
                    break;
                case 1:
                    label1.Text = "How is the character different?\n";
                    label1.Text += "1. Is the Master of the sky, wind, air and clouds\n";
                    label1.Text += "2. Is the Master of all Waters\n";
                    label1.Text += "3. Is the Master of the terra firma, mountains and metal\n";
                    label1.Text += "4. Is the Master of the woods, the patron saint of hunting\n";
                    label1.Text += "5. Is the Judge of the Dead and the Master of Doom\n";
                    label1.Text += "6. Is the character the Master of dreams\n";
                    label1.Text += "7. Has the great physical power\n";
                    label1.Text += "8. Is the lady of the stars\n";
                    label1.Text += "9. Is the patroness of plants, animals and birds\n";
                    label1.Text += "10. Is the lady of pity, grief and hope\n";
                    label1.Text += "11. Has the power to heal of wounds and mental fatigue\n";
                    label1.Text += "12. Created tapestries of Arda’s fate\n";
                    label1.Text += "13. Has eternal youth, connection with nature\n";
                    label1.Text += "14. Is very fast and agile and is the wife of Tulkas\n";
                    label1.Text += "15. Other feature";
                    break;
                case 2:
                    label1.Text = "Was the character a Dark Lord?\n";
                    label1.Text += "1. Yes\n";
                    label1.Text += "2. No";
                    break;
                case 3:
                    label1.Text = "Was the character involved in the theft of one of\n the Silmarils from the crown of Morgoth?\n";
                    label1.Text += "1. Yes\n";
                    label1.Text += "2. No";
                    break;
                case 4:
                    label1.Text = "Did the character participate in the Battle of\n Unnumbered Tears?\n";
                    label1.Text += "1. Yes\n";
                    label1.Text += "2. No";
                    break;
                case 5:
                    label1.Text = "Did Morgoth kill the character?\n";
                    label1.Text += "1. Yes\n";
                    label1.Text += "2. No";
                    break;
                case 6:
                    label1.Text = "Did the character participate in the War\n of Wrath?\n";
                    label1.Text += "1. Yes\n";
                    label1.Text += "2. No";
                    break;
                case 7:
                    label1.Text = "Who is the character’s mother?\n";
                    label1.Text += "1. Miriel\n";
                    label1.Text += "2. Indis\n";
                    label1.Text += "3. Other variant";
                    break;
                case 8:
                    label1.Text = "Is the character a member of the Elven\n royal family?\n";
                    label1.Text += "1. Yes, she is a princess/queen\n";
                    label1.Text += "2. Yes, he is prince/king\n";
                    label1.Text += "3. No";
                    break;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (I <= 9)
            {
                x[I] = textBox1.Text;
                //MessageBox.Show(x[I]);
                I++;
                Question(I);
            }

            if (I == 9)
            {
                Environment.SetEnvironmentVariable("Path", @"C:\\Program Files (x86)\\swipl\\bin");
                string[] p = { "-q","-f",@"Lab11_exercise.pl" };
                PlEngine.Initialize(p);

                PlQuery answer = new PlQuery("answer(1,Name," + x[0] + ")");
                //проверить остальные факты
                //...
                while (answer.NextSolution())
                {
                    label2.Text += "Name";
                }
                //label2.Text = "Character is Name";
            }
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }
    }
}
