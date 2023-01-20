import { IAnswer } from '../types/data';
import { Answer } from './Answer';
export const AnswerList = (props: IAnswer[]) => {  
  return (
    <>      
      {Object.values(props).map((answer: IAnswer) => {         
        return(
          <div>
            <Answer {...answer} />
          </div>
        )
      })}
    </>
  )
}