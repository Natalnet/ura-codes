import { useState } from "react";

function App() {
  const [command, setCommand] = useState("");

  const sendCommand = async () => {
    try {
      if (command == "") {
        alert("Preencha o campo de comando.");
        return;
      }

      const body = {
        input: command,
      };

      await fetch("/action", {
        method: "POST",
        body: JSON.stringify(body),
      });

      alert("Dados enviados com sucesso!");
      setCommand("");
    } catch (e) {
      alert("Erro ao enviar dados.");
    }
  };

  const move = async (where: string) => {
    await fetch(where);
  };

  return (
    <main className="w-full h-screen flex flex-col items-center lg:grid lg:grid-cols-2 lg:gap-10 px-10 py-12 divide-y lg:divide-y-0 lg:divide-x divide-gray-400">
      <div className="w-full flex flex-col items-center mb-10 lg:mb-0">
        <img src="./assets/logo.svg" className="mb-6 h-40 w-40" />
        <h1 className="font-semibold text-3xl text-slate-900 mb-6">
          <span className="text-ura-blue">URA:</span> UM ROBÔ POR ALUNO
        </h1>
        <form className="w-full flex flex-col justify-between items-start min-h-[11rem]">
          <label htmlFor="command">Digite um comando:</label>
          <input
            type="text"
            placeholder="Escreva seu comando aqui..."
            id="command"
            name="command"
            className="w-full h-14 px-4 py-2 bg-white shadow-xl shadow-slate rounded-md outline-none"
            onChange={(event) => setCommand(event.target.value)}
            value={command}
            required
          />
          <button
            type="button"
            className="w-full h-14 bg-ura-blue rounded-md text-white font-semibold cursor-pointer hover:bg-slate-900 transition-colors"
            onClick={sendCommand}
          >
            Enviar
          </button>
        </form>
      </div>
      <div className="w-full flex flex-col justify-between items-center gap-6">
        <h1 className="text-slate-900 text-6xl font-semibold mt-10">
          CONTROLE
        </h1>
        <div
          id="buttons-wrapper"
          className="flex flex-col gap-4 items-center mb-10 lg:mb-0"
        >
          <button
            className="active:animate-bounce"
            onClick={() => move("/frt")}
          >
            <img src="./assets/upbutton.svg" className="h-24" />
          </button>
          <div id="buttons-center" className="flex flex-row gap-4">
            <button
              className="active:animate-bounce"
              onClick={() => move("/esq")}
            >
              <img src="./assets/leftbutton.svg" className="h-24" />
            </button>
            <button
              className="active:animate-bounce"
              onClick={() => move("/stop")}
            >
              <img src="./assets/stopbutton.svg" className="h-24" />
            </button>
            <button
              className="active:animate-bounce"
              onClick={() => move("/drt")}
            >
              <img src="./assets/rightbutton.svg" className="h-24" />
            </button>
          </div>
          <button
            className="active:animate-bounce"
            onClick={() => move("/trs")}
          >
            <img src="./assets/downbutton.svg" className="h-24" />
          </button>
        </div>
      </div>
    </main>
  );
}

export default App;
