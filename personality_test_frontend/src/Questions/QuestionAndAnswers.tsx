import { IQuestionAndAnswers } from '../types/data';
import { Question } from '../Questions/Question';
import { AnswerList } from '../Answers/AnswersList';

export const QuestionAndAnswers = (props: IQuestionAndAnswers) => (  
  <>
    <Question {...props.question}/>
    <AnswerList {...props.answers}/>
  </>
)