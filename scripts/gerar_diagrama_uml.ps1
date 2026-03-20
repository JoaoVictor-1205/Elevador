Add-Type -AssemblyName System.Drawing

$outputPath = Join-Path $PSScriptRoot "..\docs\diagrama-uml-elevador.png"
$outputPath = [System.IO.Path]::GetFullPath($outputPath)

$attributes = @(
    "- andarMinimo: int",
    "- andarMaximo: int",
    "- andarAtual: int",
    "- portaAberta: boolean"
)

$methods = @(
    "+ Elevador(andarMinimo: int, andarMaximo: int)",
    "+ subir(): boolean",
    "+ descer(): boolean",
    "+ abrirPorta(): boolean",
    "+ fecharPorta(): boolean",
    "+ isPortaAberta(): boolean",
    "+ getAndarAtual(): int",
    "+ getAndarMinimo(): int",
    "+ getAndarMaximo(): int",
    "+ getStatusPorta(): String"
)

$width = 1400

$borderPen = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(30, 41, 59)), 3
$dividerPen = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(100, 116, 139)), 2
$notePen = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(217, 119, 6)), 2
$connectorPen = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(217, 119, 6)), 2
$connectorPen.DashStyle = [System.Drawing.Drawing2D.DashStyle]::Dash

$classBackground = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(248, 250, 252))
$headerBackground = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(219, 234, 254))
$noteBackground = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(255, 247, 237))
$textBrush = [System.Drawing.Brushes]::Black

$titleFont = New-Object System.Drawing.Font("Arial", 22, [System.Drawing.FontStyle]::Bold)
$sectionFont = New-Object System.Drawing.Font("Arial", 18, [System.Drawing.FontStyle]::Bold)
$textFont = New-Object System.Drawing.Font("Consolas", 16, [System.Drawing.FontStyle]::Regular)
$noteFont = New-Object System.Drawing.Font("Arial", 15, [System.Drawing.FontStyle]::Regular)

$classX = 120
$classY = 90
$classWidth = 760
$headerHeight = 90
$sectionContentOffset = 55
$rowHeight = 38
$sectionBottomPadding = 45
$attributesHeight = $sectionContentOffset + (($attributes.Count - 1) * $rowHeight) + $sectionBottomPadding
$methodsHeight = $sectionContentOffset + (($methods.Count - 1) * $rowHeight) + $sectionBottomPadding
$classHeight = $headerHeight + $attributesHeight + $methodsHeight
$height = [Math]::Max(900, $classY + $classHeight + 50)

$bitmap = New-Object System.Drawing.Bitmap $width, $height
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)

$graphics.Clear([System.Drawing.Color]::White)
$graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::ClearTypeGridFit

$headerRect = New-Object System.Drawing.Rectangle $classX, $classY, $classWidth, $headerHeight
$classRect = New-Object System.Drawing.Rectangle $classX, $classY, $classWidth, $classHeight

$line1Y = $classY + $headerHeight
$line2Y = $line1Y + $attributesHeight

$graphics.FillRectangle($classBackground, $classRect)
$graphics.FillRectangle($headerBackground, $headerRect)
$graphics.DrawRectangle($borderPen, $classRect)
$graphics.DrawLine($dividerPen, $classX, $line1Y, $classX + $classWidth, $line1Y)
$graphics.DrawLine($dividerPen, $classX, $line2Y, $classX + $classWidth, $line2Y)

$stringFormat = New-Object System.Drawing.StringFormat
$stringFormat.Alignment = [System.Drawing.StringAlignment]::Center
$stringFormat.LineAlignment = [System.Drawing.StringAlignment]::Center

$graphics.DrawString("Elevador", $titleFont, $textBrush, [System.Drawing.RectangleF]::new($classX, $classY, $classWidth, $headerHeight), $stringFormat)

$graphics.DrawString("Atributos", $sectionFont, $textBrush, 150, ($line1Y + 15))
$graphics.DrawString("Metodos", $sectionFont, $textBrush, 150, ($line2Y + 15))

$attributeStartY = $line1Y + 55
for ($i = 0; $i -lt $attributes.Count; $i++) {
    $graphics.DrawString($attributes[$i], $textFont, $textBrush, 155, ($attributeStartY + ($i * 38)))
}

$methodStartY = $line2Y + 55
for ($i = 0; $i -lt $methods.Count; $i++) {
    $graphics.DrawString($methods[$i], $textFont, $textBrush, 155, ($methodStartY + ($i * 38)))
}

$noteX = 960
$noteY = 170
$noteWidth = 300
$noteHeight = 290
$noteRect = New-Object System.Drawing.Rectangle $noteX, $noteY, $noteWidth, $noteHeight

$graphics.FillRectangle($noteBackground, $noteRect)
$graphics.DrawRectangle($notePen, $noteRect)
$graphics.DrawString("Restricoes", $sectionFont, $textBrush, ($noteX + 20), ($noteY + 18))

$noteLines = @(
    "1. Nao sobe acima do",
    "   ultimo andar.",
    "",
    "2. Nao desce abaixo do",
    "   andar minimo.",
    "",
    "3. Nao sobe ou desce",
    "   com a porta aberta."
)

$noteStartY = $noteY + 60
for ($i = 0; $i -lt $noteLines.Count; $i++) {
    $graphics.DrawString($noteLines[$i], $noteFont, $textBrush, ($noteX + 20), ($noteStartY + ($i * 28)))
}

$graphics.DrawLine($connectorPen, ($classX + $classWidth), ($classY + 220), $noteX, ($noteY + 140))

$bitmap.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)

$titleFont.Dispose()
$sectionFont.Dispose()
$textFont.Dispose()
$noteFont.Dispose()
$classBackground.Dispose()
$headerBackground.Dispose()
$noteBackground.Dispose()
$borderPen.Dispose()
$dividerPen.Dispose()
$notePen.Dispose()
$connectorPen.Dispose()
$graphics.Dispose()
$bitmap.Dispose()

Write-Output "Diagrama gerado em: $outputPath"
