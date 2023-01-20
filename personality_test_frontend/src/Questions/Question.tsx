import { IQuestion } from '../types/data';
export const Question = (props: IQuestion) => (
  <>
    <p>{props.content}</p>
    <p>{props.id}</p>
  </>
)