
import { useState, useEffect } from "react"
import { IQuestionAndAnswers } from "../types/data"
import { QuestionAndAnswers } from "./QuestionAndAnswers";
import axios from 'axios';

export const QuestionList = () => {
  const [questions_and_answers, setQuestionsAndAnswers] = useState<IQuestionAndAnswers[]>([])
  const [isUpdate, setUpdate] = useState<boolean>(false)

  useEffect(() => {
    getQuestions()
    setUpdate(false)
  }, [isUpdate])

  const getQuestions = async () => {
    try {
      const response = await axios
        .get(`${global.api_host}personality_test`, { withCredentials: true })

      const data = response.data;
      
      setQuestionsAndAnswers(data.questions_and_answers);

    } catch(error: any) {
      console.log(error)
    }
  }
  
  return (
    <>      
      <h1>Question List</h1>
      {questions_and_answers.map((question_and_answers: IQuestionAndAnswers) => {         
        return(
          <div>
            <QuestionAndAnswers question={question_and_answers.question} answers={question_and_answers.answers} />
          </div>
        )
      })}
      
    </>
  )
}