import { Routes, Route } from 'react-router-dom'
import { HomePage } from './Pages/HomePage';
import { NotFoundPage } from './Pages/NotFoundPage';
import { Container } from 'react-bootstrap';

function App() {
  return (
    <>
      <Container>      
        <Routes>
          <Route path="/" element={<HomePage />} />
          <Route path="*" element={<NotFoundPage />} />
        </Routes>
      </Container>
    </>
  );
}
export default App;