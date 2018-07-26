#File                    :   .ps1
#Programmer              :   YuCong windmillyucong@163.com
#Description             :   Windows PowerShell�ű�����ping����
#Modification History    :   ver1.0, 2017.09.17, William Yu
#                            ver1.1, 2017.09.18, William Yu add notes  
$ComPList = Get-Content "��վ�б�.txt"
"��ʼʱ�� $(Get-Date)" >> log.txt
function Ping_Test
{
    PROCESS
    {
      $ping = $false
      $results = Get-WmiObject -query "SELECT * FROM Win32_PingStatus WHERE Address = '$_'"
      $RT = $results.ResponseTime
      $TTL = $results.ResponseTimeToLive
      foreach ($result in $results)
      {
        if ($results.StatusCode -eq 0)
        {
            if ($TTL -ge 98 -and $TTL -le 128)
                {Write-Host "$_ ������Ӧʱ�� $RT ms" -ForegroundColor Green
				"$_ ������Ӧʱ�� $RT ms" >> log.txt}
             else
                {Write-Host "$_ ������Ӧʱ�� $RT ms" -ForegroundColor Blue
				"$_ ������Ӧʱ�� $RT ms" >> log.txt}
        }
        else
        {
          Write-Host "$_ ��ʱ!"-ForegroundColor Red
		  "$_ ������Ӧʱ�� ��ʱ ms" >> log.txt
        }
      }
    }
}
foreach ($Server in $ComPList)
{
  $Server | Ping_Test
}
"����ʱ�� $(Get-Date)" >> log.txt
Write-Host "ȫ��ִ�н���,�Ѽ�¼��log.txt��" -ForegroundColor White
Pause