const listaAlunos = document.getElementById('alunos');
const nomeAlunoInput = document.getElementById('nome-aluno');
const adicionarAlunoBtn = document.getElementById('adicionar-aluno');

adicionarAlunoBtn.addEventListener('click', adicionarAluno);

function adicionarAluno() {
    const nomeAluno = nomeAlunoInput.value;
    if (!nomeAluno) {
        return;
    }

    const novoAluno = document.createElement('li');
    novoAluno.textContent = nomeAluno;
    novoAluno.classList.add('presente');

    const botaoPresente = document.createElement('button');
    botaoPresente.textContent = 'Presente';
    botaoPresente.classList.add('botao-presente');
    botaoPresente.addEventListener('click', marcarPresente);

    const botaoAusente = document.createElement('button');
    botaoAusente.textContent = 'Ausente';
    botaoAusente.classList.add('botao-ausente');
    botaoAusente.addEventListener('click', marcarAusente);

    novoAluno.appendChild(botaoPresente);
    novoAluno.appendChild(botaoAusente);

    listaAlunos.appendChild(novoAluno);

    nomeAlunoInput.value = '';
    nomeAlunoInput.focus();
}

function marcarPresente(e) {
    const aluno = e.target.parentNode;
    aluno.classList.remove('ausente');
    aluno.classList.add('presente');
}

function marcarAusente(e) {
    const aluno = e.target.parentNode;
    aluno.classList.remove('presente');
    aluno.classList.add('ausente');
}