import clips
import tkinter

root = tkinter.Tk()
root.geometry("400x500")
env = clips.Environment()
env.load("rules.clp")
questions = []
label = tkinter.Label(root, text="Press start button to begin")
label.pack()
dialogFrame = tkinter.Frame(root)
dialogFrame.pack()
answersFrame = tkinter.Frame(root)
answersFrame.pack()
answers = []
r = tkinter.StringVar()
r.set(None)

def getQuestion():
  global answers
  for fact in env.facts():
    if fact.template.name == "wynik":
      resultFrame = tkinter.LabelFrame(dialogFrame)
      resultFrame.pack()
      tkinter.Label(resultFrame, text="Your wine:").pack()
      tkinter.Label(resultFrame, text=fact["nazwa"], font="arial 10 bold").pack()
      tkinter.Label(resultFrame, text=fact["opis"]).pack()
      startButton.destroy()
      for ans in answers:
          ans.destroy()
      return
    elif fact.template.name == "pytanie":
      if fact["numer"] not in questions:
        questions.append(fact["numer"])
        for ans in answers:
          ans.destroy()
        answers = []
        tkinter.Label(dialogFrame, text=fact["tresc"], font="arial 10 bold").pack()
        for i in range(len(fact["odpowiedzi"])):
          answers.append(tkinter.Radiobutton(answersFrame, text=fact["odpowiedzi"][i], variable=r, value=fact["odpowiedzi"][i]))
          answers[i].pack()

def Next():
  ans = r.get()
  if ans != "None":
    template = env.find_template("odpowiedz")
    template.assert_fact(pytanie=questions[-1], tresc=r.get())
    tkinter.Label(dialogFrame, text=r.get()).pack()
    env.run()
    r.set(None)
    #for fact in env.facts():
    #  print(fact)
    getQuestion()

def Start(self):
  env.reset()
  global questions
  env.run()
  self.config(text="Next", command=Next)
  label.destroy()
  getQuestion()

startButton = tkinter.Button(root, text="Start", command=lambda: Start(startButton))
startButton.pack()
#fact = env.find_defined_facts(name = "lol")

root.mainloop()