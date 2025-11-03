Sleep 5000

class GithubClass {
    link := ''

    __new(github_user, repo) {
        this.link := 'https://github.com/' github_user '/' repo
    }

    GetLatestVersionURL(item) {
        return this.link '/releases/latest/download/' item
    }
}

macro_path := A_ScriptDir '\Salmon_AV.exe'


MsgBox 'Click ok to start updating / downloading'

try {
    g := GithubClass('SalmonDXH', 'Anime_Vanguard-Macro-2')

    try FileDelete(macro_path)
    Download(g.GetLatestVersionURL('Salmon_AV.exe'), macro_path)
} catch Error as e {
    MsgBox e.Message
    ExitApp()
}

Sleep 500
Run macro_path