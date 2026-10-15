using System;
using System.Diagnostics;
using System.IO;
using System.Windows.Forms;

namespace TokenViewer
{
    static class Program
    {
        [STAThread]
        static void Main(string[] args)
        {
            try
            {
                string baseDir = AppDomain.CurrentDomain.BaseDirectory;
                string htmlFile = Path.Combine(baseDir, "index.html");
                if (!File.Exists(htmlFile))
                {
                    htmlFile = Path.Combine(baseDir, "TokenViewer.html");
                }

                if (!File.Exists(htmlFile))
                {
                    MessageBox.Show(
                        "Cannot find index.html or TokenViewer.html in:\n" + baseDir,
                        "TokenViewer - File Not Found",
                        MessageBoxButtons.OK,
                        MessageBoxIcon.Error
                    );
                    return;
                }

                string url = new Uri(htmlFile).AbsoluteUri;

                // Candidate paths for Chromium-based browsers supporting --app mode
                string[] candidateExecutables = new string[]
                {
                    "msedge.exe",
                    "chrome.exe",
                    Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFilesX86), @"Microsoft\Edge\Application\msedge.exe"),
                    Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles), @"Microsoft\Edge\Application\msedge.exe"),
                    Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles), @"Google\Chrome\Application\chrome.exe"),
                    Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFilesX86), @"Google\Chrome\Application\chrome.exe")
                };

                bool launched = false;
                foreach (string candidate in candidateExecutables)
                {
                    try
                    {
                        ProcessStartInfo psi = new ProcessStartInfo();
                        psi.FileName = candidate;
                        psi.Arguments = string.Format("--app=\"{0}\" --window-size=1200,800", url);
                        psi.UseShellExecute = true;

                        Process.Start(psi);
                        launched = true;
                        break;
                    }
                    catch
                    {
                        // Continue to next candidate
                    }
                }

                // Fallback to default system browser if app mode launch failed
                if (!launched)
                {
                    Process.Start(new ProcessStartInfo
                    {
                        FileName = url,
                        UseShellExecute = true
                    });
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(
                    "Error launching TokenViewer:\n" + ex.Message,
                    "TokenViewer",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Error
                );
            }
        }
    }
}
