Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Main form
$form = New-Object System.Windows.Forms.Form
$form.FormBorderStyle = 'None'
$form.StartPosition = 'CenterScreen'
$form.Width = 450
$form.Height = 200
$form.TopMost = $true
$form.BackColor = [System.Drawing.Color]::DodgerBlue  # outer blue border

# Inner panel (content area)
$innerPanel = New-Object System.Windows.Forms.Panel
$innerPanel.BackColor = [System.Drawing.Color]::LightGray  # light gray
$innerPanel.Left = 10   # leave border on sides
$innerPanel.Top = 30    # leave space for title bar
$innerPanel.Width = $form.Width - 20
$innerPanel.Height = $form.Height - 40  # bottom border
$form.Controls.Add($innerPanel)

# Title bar panel
$titleBar = New-Object System.Windows.Forms.Panel
$titleBar.BackColor = [System.Drawing.Color]::DodgerBlue
$titleBar.Left = 0
$titleBar.Top = 0
$titleBar.Width = $form.Width
$titleBar.Height = 30
$form.Controls.Add($titleBar)

# Title label
$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Text = "Touch Grass Reminder"
$titleLabel.ForeColor = [System.Drawing.Color]::LightGray
$titleLabel.Font = New-Object System.Drawing.Font("Tahoma",10,[System.Drawing.FontStyle]::Bold)
$titleLabel.AutoSize = $false
$titleLabel.TextAlign = 'MiddleLeft'
$titleLabel.Left = 10
$titleLabel.Top = 0
$titleLabel.Width = 350
$titleLabel.Height = 30
$titleBar.Controls.Add($titleLabel)

# Close button (red X)
$closeButton = New-Object System.Windows.Forms.Button
$closeButton.Text = "X"
$closeButton.ForeColor = [System.Drawing.Color]::White
$closeButton.BackColor = [System.Drawing.Color]::Red
$closeButton.FlatStyle = 'Flat'
$closeButton.FlatAppearance.BorderSize = 0
$closeButton.Width = 30
$closeButton.Height = 30
$closeButton.Left = $form.Width - 35
$closeButton.Top = 0
$closeButton.Add_Click({$form.Close()})
$titleBar.Controls.Add($closeButton)

# Message label
$label = New-Object System.Windows.Forms.Label
$label.Text = "Touch some freaking grass!"
$label.AutoSize = $false
$label.TextAlign = 'MiddleCenter'
$label.Dock = 'Top'
$label.Height = 80
$innerPanel.Controls.Add($label)

# Buttons
$okButton = New-Object System.Windows.Forms.Button
$okButton.Text = "OK"
$okButton.Width = 80
$okButton.Height = 30
$okButton.Top = 100
$okButton.Left = 140
$okButton.Add_Click({$form.Close()})
$innerPanel.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Text = "Later"
$cancelButton.Width = 80
$cancelButton.Height = 30
$cancelButton.Top = 100
$cancelButton.Left = 230
$cancelButton.Add_Click({$form.Close()})
$innerPanel.Controls.Add($cancelButton)

# Make window draggable by title bar
$mouseDown = $false
$titleBar.Add_MouseDown({$mouseDown = $true; $global:mousePos = $form.PointToClient([System.Windows.Forms.Cursor]::Position)})
$titleBar.Add_MouseUp({$mouseDown = $false})
$titleBar.Add_MouseMove({
    if ($mouseDown) {
        $p = [System.Windows.Forms.Cursor]::Position
        $form.Location = New-Object System.Drawing.Point($form.Location.X + ($p.X - $global:mousePos.X), $form.Location.Y + ($p.Y - $global:mousePos.Y))
    }
})

# Show the form
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()
